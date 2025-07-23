# Concept Document: Tibial Reports API

## Problem Statement
The existing `/patients/:patient_id/reports` API endpoint needs to be enhanced to provide procedure-specific report lists for patients. Currently, tibial patient reports are not accessible via API, preventing providers and patient advocates from programmatically accessing tibial-specific reports for their patients.

## Solution Approach
Modify the existing reports controller (config/routes.rb:L261) to handle tibial-specific reports using the new `tibial_reports` table and `TibialReport` model. The solution will extend the current endpoint to filter reports by procedure type using existing procedure_id logic from the user_procedures table, ensuring tibial patients receive their appropriate reports while maintaining existing Interstim functionality.

## Acceptance Criteria
- API filters reports by procedure type using existing procedure_id logic from user_procedures table
- Reports are sorted by generation date (newest first) 
- Response follows existing format with `is_report_generation_available` and `data` fields
- `is_report_generation_available` logic updated to check baseline existence and at least one diary day summary for tibial patients (not baseline + DCP data like Interstim)
- Report titles follow pattern: "Tibial Comparison Report N" (where N is the count)
- API returns empty data array when no reports exist
- Existing Interstim reports functionality remains unchanged
- Uses `TibialReport` model and `tibial_reports` table for tibial patient data

## Constraints & Assumptions

### Technical Constraints
- Must reuse existing S3 URL generation and security patterns
- Must follow existing error handling patterns as current reports API
- Must maintain existing permission structure for providers and patient advocates

### Business Constraints
- Existing Interstim reports functionality must remain completely unchanged
- Response format must match existing reports API structure exactly
- Must support both providers and patient advocates access patterns

### Assumptions
- The `tibial_reports` table and `TibialReport` model will be available for implementation
- Existing procedure_id logic in user_procedures table correctly identifies tibial patients
- Baseline and diary day summary data structures are consistent between Interstim and tibial procedures
- Current authentication and authorization mechanisms are sufficient for tibial report access

## Context & Background
This enhancement extends the existing reports API to support tibial patients alongside the current Interstim patient support. The API currently serves providers and patient advocates for Interstim reports, and this implementation will provide equivalent functionality for tibial patients using a dedicated data model and table structure. The solution leverages existing patterns for S3 storage, security, and error handling to ensure consistency across the platform.

## Next Steps
- Proceed to requirements.md for detailed requirement gathering
- Key questions to address in requirements phase:
  - Detailed `TibialReport` model structure and relationships
  - Database schema for `tibial_reports` table
  - Specific controller modifications needed for procedure type filtering
  - Integration points between `TibialReport` and existing user_procedures logic
  - Testing strategy for both tibial and Interstim report functionality