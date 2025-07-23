# Requirements Specification: Tibial Reports API

## Functional Requirements

### FR-001: Tibial Reports API Integration
**Description**: Extend existing `/patients/:patient_id/reports` endpoint to support tibial-specific reports
**Priority**: High
**User Story**: As a provider or patient advocate, I want to fetch tibial reports via API so that I can display the list of available reports for tibial patients.

**Acceptance Criteria**:
- [ ] API filters reports by querying TibialReport table directly by patient_id
- [ ] Reports are sorted by generation date (newest first) 
- [ ] Response follows existing format with `is_report_generation_available` and `data` fields
- [ ] Report titles follow pattern: "Tibial Comparison Report N" (where N is the count)
- [ ] API returns empty data array when no tibial reports exist
- [ ] Existing Interstim reports functionality remains unchanged

**Business Rules**:
- Query TibialReport table by patient_id (not procedure_id)
- Sort reports by generation date (newest first)
- Generate report titles as "Tibial Comparison Report N" format
- Return empty data array when no reports exist for patient

### FR-002: Tibial Report Availability Logic
**Description**: Implement tibial-specific logic for `is_report_generation_available` field
**Priority**: High
**User Story**: As a provider, I want to know when tibial reports can be generated so that I understand data availability for my patients.

**Acceptance Criteria**:
- [ ] Check if patient has baseline data recorded
- [ ] Check if patient has at least one diary day summary
- [ ] Both baseline + diary day summary required for `is_report_generation_available: true`
- [ ] Different logic from Interstim which requires baseline + DCP data
- [ ] Availability flag accurately reflects tibial data requirements

**Business Rules**:
- Baseline data existence is required
- At least one diary day summary is required
- Both conditions must be met for report generation availability
- Logic differs from Interstim baseline + DCP data requirements

### FR-003: Data Transformation and Response Format
**Description**: Transform TibialReport database records to match existing API response structure
**Priority**: High
**User Story**: As a frontend developer, I want tibial reports to use the same API format as existing reports so that I can reuse existing UI components.

**Acceptance Criteria**:
- [ ] Transform database records to match existing API response format
- [ ] Generate S3 URLs using existing security patterns
- [ ] Format timestamps consistently with existing reports
- [ ] Format user names consistently with existing reports
- [ ] Response structure identical to existing reports API

**Business Rules**:
- Response format must exactly match existing reports API structure
- S3 URL generation must follow existing security patterns
- Timestamp and user name formatting must be consistent
- All data transformations maintain existing API contract

## User Stories

### US-001: Provider Accessing Tibial Reports
**As a** healthcare provider  
**I want to** access tibial reports for my patients via API  
**So that** I can programmatically display available reports in my clinical interface

**Acceptance Criteria**:
- Provider calls `/patients/:patient_id/reports` for tibial patient
- System detects patient type and queries TibialReport table
- API returns tibial-specific reports in existing format
- Provider can access report files through generated S3 URLs

### US-002: Patient Advocate Report Access
**As a** patient advocate  
**I want to** retrieve tibial reports for patients I support  
**So that** I can help patients understand their treatment progress

**Acceptance Criteria**:
- Patient advocate has appropriate permissions for patient
- API returns tibial reports when patient has tibial procedures
- Empty data array returned when no reports exist
- Availability flag indicates when new reports can be generated

### US-003: Mixed Procedure Type Scenarios
**As a** system user  
**I want** consistent API behavior regardless of patient procedure type  
**So that** the same endpoint works for all patients

**Scenarios**:
- Patient with only tibial procedures → returns only tibial reports
- Patient with only Interstim procedures → returns only Interstim reports (existing)
- Patient with no reports → returns empty data array with appropriate availability flag

## Non-Functional Requirements

### NFR-001: Performance
- **Response Time**: Match existing reports API performance (under 2-3 seconds)
- **Concurrent Users**: Handle multiple provider/patient advocate requests simultaneously
- **Database Efficiency**: Avoid N+1 query problems with direct patient_id lookup
- **Caching**: Leverage existing caching patterns where available

### NFR-002: Security  
- **Authentication**: Reuse existing authentication mechanisms
- **Authorization**: Maintain provider and patient advocate permission structure
- **Data Access**: Follow existing S3 URL generation and security patterns
- **Patient Privacy**: Ensure tibial reports only accessible to authorized users

### NFR-003: Reliability
- **Error Handling**: Follow existing reports API error handling patterns
- **Validation**: Validate patient_id exists and user has access permissions
- **Graceful Degradation**: Handle cases where no tibial reports exist gracefully
- **Backwards Compatibility**: Maintain existing Interstim functionality unchanged

## Technical Constraints

### Database Integration
- Must query TibialReport table directly by patient_id
- Must maintain existing user_procedures table relationships
- Must preserve existing Interstim report query patterns
- Must support efficient sorting by generation date

### API Integration
- Must use existing `/patients/:patient_id/reports` endpoint
- Must maintain existing controller structure (config/routes.rb:L261)
- Must follow existing error handling patterns
- Must preserve existing authentication/authorization middleware

### Storage Integration
- Must reuse existing S3 URL generation and security patterns
- Must maintain consistent file access patterns
- Must follow existing security token generation
- Must preserve existing file storage organization

## API Requirements

### Endpoint Specification
**URL**: `/patients/:patient_id/reports`
**Method**: GET
**Authentication**: Required (existing mechanism)
**Authorization**: Provider or Patient Advocate for specified patient

### Request Parameters
- `patient_id` (required): UUID of the patient

### Response Format
```json
{
  "is_report_generation_available": boolean,
  "data": [
    {
      "id": "report_id",
      "title": "Tibial Comparison Report N",
      "status": "completed|pending|failed",
      "created_at": "formatted_datetime",
      "created_by": "user_full_name",
      "is_latest": boolean
    }
  ]
}
```

### Error Responses
- `404`: Patient not found
- `403`: Insufficient permissions
- `500`: Internal server error
- Follow existing reports API error format and messages

## Acceptance Criteria

### Functional Testing
- [ ] API successfully filters and returns tibial reports for tibial patients
- [ ] Response format exactly matches existing reports API structure
- [ ] All business rules implemented (sorting, titles, availability logic)
- [ ] Existing Interstim functionality completely unchanged and working
- [ ] Empty data array returned when no tibial reports exist
- [ ] `is_report_generation_available` correctly calculated for tibial patients
- [ ] Report titles follow "Tibial Comparison Report N" pattern

### Integration Testing
- [ ] TibialReport model integration with patient records works correctly
- [ ] S3 URL generation follows existing security patterns
- [ ] Authentication/authorization middleware functions properly
- [ ] Existing reports controller structure maintained
- [ ] Database queries perform efficiently
- [ ] Error handling consistent with existing patterns

### User Acceptance Testing
- [ ] Providers can successfully access tibial reports for their patients
- [ ] Patient advocates can retrieve reports for patients they support
- [ ] Frontend applications can consume API using existing integration patterns
- [ ] Response times meet performance requirements
- [ ] Security access controls work as expected

## Data Requirements

### TibialReport Model Structure
- Query by patient_id (primary lookup method)
- Include report metadata (id, title, status, timestamps, user info)
- Support sorting by generation date
- Maintain relationships with patient records
- Include is_latest flag calculation

### Availability Logic Data
- Access to patient baseline data
- Access to diary day summary records
- Both data types required for report generation availability
- Different requirements from Interstim baseline + DCP logic

### Response Data Transformation
- Convert database timestamps to formatted datetime strings
- Transform user records to full name display format
- Generate secure S3 URLs with appropriate expiration
- Calculate is_latest flags across all patient reports
- Maintain consistent field naming with existing API

## Dependencies & Assumptions

### Dependencies
- TibialReport model and tibial_reports table availability
- Existing reports controller and routing structure
- Current authentication/authorization system
- S3 storage and URL generation infrastructure
- Patient baseline and diary day summary data structures

### Assumptions
- TibialReport table schema supports required queries and sorting
- Existing permission system adequately covers tibial report access
- Baseline and diary day summary data structures are consistent
- Current S3 security patterns are sufficient for tibial reports
- Database performance adequate for additional tibial report queries
- Frontend applications can consume identical API format for tibial reports