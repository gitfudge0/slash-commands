# Git Diff

```diff
diff --git a/app/controllers/insights/patients/reports_controller.rb b/app/controllers/insights/patients/reports_controller.rb
index 67e1d515..ac14ef61 100644
--- a/app/controllers/insights/patients/reports_controller.rb
+++ b/app/controllers/insights/patients/reports_controller.rb
@@ -12,26 +12,22 @@ module Insights
       before_action :authorize_report_policy
 
       def index
-        eval_procedure = set_latest_eval_procedure unless @user_procedure.is_evaluation?
-
-        if !@user_procedure.is_evaluation? && eval_procedure.nil?
-          render json: { is_report_generation_available: false, data: [] }, status: :ok
-          return
+        if tibial_patient?
+          handle_tibial_reports_index
+        else
+          handle_interstim_reports_index
         end
-        @user_procedure = eval_procedure if eval_procedure.present?
-        @can_generate = check_can_generate_report?
-        @reports = @user_procedure&.hcp_reports&.order(created_at: :desc)
-
-        # Eager load requested_by users
-        user_ids = @reports.map(&:requested_by).uniq
-        @requested_by_users = User.where(id: user_ids).index_by(&:id)
       end
 
       def show
-        report = HcpReport.find_by(id: params[:id])
+        report = if tibial_report_request?
+                   TibialReport.find_by(id: params[:id], patient_id: @patient.id)
+                 else
+                   HcpReport.find_by(id: params[:id])
+                 end
 
         if report.nil?
-          render json: { success: false, message: I18n.t('patient_report.no_reports') }, status: :bad_request
+          render json: { success: false, message: I18n.t('patient_report.no_reports') }, status: :not_found
           return
         end
 
@@ -42,13 +38,16 @@ module Insights
 
       def create
         unless @patient.pq_done?
-          return failure message: I18n.t('evaluation_report.no_pq'), status: :unprocessable_entity
+          render json: { success: false, message: I18n.t('evaluation_report.no_pq') }, status: :unprocessable_entity
+          return
         end
 
-        @user_procedure = set_latest_eval_procedure unless @user_procedure.is_evaluation?
+        ensure_evaluation_user_procedure!
 
         if @user_procedure&.baseline_datum.blank?
-          return failure message: I18n.t('patient_report.missing_baseline_data'), status: :unprocessable_entity
+          render json: { success: false, message: I18n.t('patient_report.missing_baseline_data') },
+                 status: :unprocessable_entity
+          return
         end
 
         Insights::Patients::GenerateHcpReportJob.perform_later(@user_procedure.id, current_user.id)
@@ -56,7 +55,8 @@ module Insights
         render json: { message: I18n.t('patient_report.report_generated') }, status: :created
       rescue StandardError => e
         Rails.logger.error("Failed to create HCP report: #{e.message}\n#{e.backtrace.join("\n")}")
-        render json: { errors: I18n.t('patient_report.report_not_generated') }, status: :unprocessable_entity
+        render json: { success: false, message: I18n.t('patient_report.report_not_generated') },
+               status: :unprocessable_entity
       end
 
       private
@@ -65,12 +65,56 @@ module Insights
         authorize :report, policy_class: Insights::ReportsPolicy
       end
 
+      def ensure_evaluation_user_procedure!
+        @user_procedure = set_latest_eval_procedure unless @user_procedure.is_evaluation?
+      end
+
       def check_can_generate_report?
-        return false if @user_procedure&.baseline_datum.blank? || @user_procedure&.collection_period_data.blank?
+        if tibial_patient?
+          return false if @user_procedure&.baseline_datum.blank?
+
+          day_summaries = DaySummary.where(user_id: @patient.id)
+          return false if day_summaries.blank?
+
+          true
+        else
+          return false if @user_procedure&.baseline_datum.blank? || @user_procedure&.collection_period_data.blank?
+
+          current_datetime = Time.current
+          first_period = @user_procedure.collection_period_data.order(:start_datetime).first
+          !!(first_period&.end_datetime && current_datetime > first_period.end_datetime)
+        end
+      end
+
+      def tibial_patient?
+        @user_procedure&.is_tibial?
+      end
+
+      def tibial_report_request?
+        tibial_patient? && TibialReport.exists?(id: params[:id], patient_id: @patient.id)
+      end
+
+      def load_requested_by_users(reports)
+        user_ids = reports.map(&:requested_by).uniq
+        User.where(id: user_ids).index_by(&:id)
+      end
+
+      def handle_tibial_reports_index
+        @can_generate = check_can_generate_report?
+        @reports = TibialReport.where(patient_id: @patient.id).order(created_at: :desc)
+        @requested_by_users = load_requested_by_users(@reports)
+      end
 
-        current_datetime = Time.current
-        first_period = @user_procedure.collection_period_data.order(:start_datetime).first
-        first_period&.end_datetime && current_datetime > first_period.end_datetime
+      def handle_interstim_reports_index
+        ensure_evaluation_user_procedure!
+
+        if @user_procedure.nil?
+          render json: { is_report_generation_available: false, data: [] }, status: :ok
+          return
+        end
+        @can_generate = check_can_generate_report?
+        @reports = @user_procedure&.hcp_reports&.order(created_at: :desc)
+        @requested_by_users = load_requested_by_users(@reports)
       end
     end
   end
diff --git a/app/views/insights/patients/reports/index.jbuilder b/app/views/insights/patients/reports/index.jbuilder
index 4e169f56..e11580e2 100644
--- a/app/views/insights/patients/reports/index.jbuilder
+++ b/app/views/insights/patients/reports/index.jbuilder
@@ -1,9 +1,21 @@
 json.is_report_generation_available @can_generate
 json.data @reports.each_with_index.to_a do |(report, index)|
-  timezone = report.user_procedure.location.timezone
+  # Handle timezone for both tibial and interstim reports
+  if @user_procedure&.is_tibial?
+    timezone = @user_procedure&.location&.timezone || 'UTC'
+  else
+    timezone = report.user_procedure.location.timezone
+  end
 
   json.id report.id
-  json.title "#{I18n.t('hcp_report.interstim_report')} #{@reports.count - index}"
+  
+  # Conditional title logic based on patient type
+  if @user_procedure&.is_tibial?
+    json.title report.report_title # Use report_title column from tibial_reports
+  else
+    json.title "#{I18n.t('hcp_report.interstim_report')} #{@reports.count - index}" # Existing Interstim logic
+  end
+  
   json.status report.status
   json.created_at report.created_at&.in_time_zone(timezone).strftime(Constant::REPORT_CREATED_ON_FORMAT)
   json.created_by @requested_by_users[report.requested_by]&.full_name
```