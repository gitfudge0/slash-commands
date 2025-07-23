# Express Development Workflow

## Overview
Ultra-fast workflow for extensions, bug fixes, and small modifications where existing patterns can be leveraged. Generates minimal documentation with immediate high-quality implementation.

**Target Time**: 2-3 minutes total
**Best For**: API extensions, bug fixes, adding features to existing systems

## Prerequisites
- Routed here by start-workflow.md with complexity score ≤ 0
- Existing code patterns identified for the requested change
- Clear scope with minimal unknowns

## Process

### Phase 1: Auto-Discovery & Confirmation (30 seconds)
```
Based on your request: "{user_input}"

Files identified for modification:
✓ {file1} - {reason why it needs changes}
✓ {file2} - {reason why it needs changes}
? {file3} - {uncertain, needs confirmation}

Patterns found:
✓ {existing_pattern1} - Will follow this approach
✓ {existing_pattern2} - Will adapt this logic

Confirm scope (Y/N): ___
```

### Phase 2: Implementation Spec Generation (1-2 minutes)
Reads all identified files in parallel and generates comprehensive implementation spec.

### Phase 3: User Approval & Implementation (30 seconds)
Single approval gate followed by immediate code generation using cached context.

## Generated File

Creates: `tasks/{issue-name}/express-spec.md`

## Express Spec Template

```markdown
# Express Implementation: {Feature Name}

## Context Analysis
**Input**: {original user request}
**Complexity Score**: {score} (Express Mode)
**Patterns Identified**: {list of existing patterns to follow}

## Files Requiring Changes

### {file_path_1}
**Why**: {clear explanation of why this file needs modification}
**Changes**: 
- {specific change 1}
- {specific change 2}
**Pattern**: Following existing {pattern_name} approach from {reference_location}

### {file_path_2}  
**Why**: {clear explanation}
**Changes**: {specific modifications}
**Pattern**: Adapting {existing_pattern} used in {similar_feature}

## Implementation Strategy
{Brief explanation of how changes integrate with existing codebase}

**Key Integration Points**:
- {integration_point_1}: {how it connects}
- {integration_point_2}: {how it connects}

**Edge Cases Covered**:
- {edge_case_1}: {handling approach based on existing code}
- {edge_case_2}: {handling approach based on existing code}

**Validation Points**:
- {what_to_test_1}
- {what_to_test_2}

## EARS Acceptance Criteria
Based on existing code patterns and business logic:

1. WHEN {trigger_condition} THEN system SHALL {expected_response} following {existing_pattern}
2. IF {precondition} THEN system SHALL {expected_behavior} consistent with {related_feature}
3. WHEN {edge_case_condition} THEN system SHALL {fallback_behavior} matching {current_error_handling}

## Generated Implementation

### {file_path_1}
```{file_extension}
{generated_code_following_existing_patterns}
```

### {file_path_2}
```{file_extension}
{generated_code_with_pattern_consistency}
```

## Quality Checklist
- [ ] Follows existing code conventions and style
- [ ] Uses established error handling patterns
- [ ] Maintains consistent naming conventions
- [ ] Integrates with existing authentication/authorization
- [ ] Preserves backward compatibility
- [ ] Includes appropriate validation/sanitization

## Validation Commands
{Relevant lint/test commands based on project structure}
```bash
{linting_command}
{test_command}
{build_command}
```

## Implementation Notes
- **Pattern Consistency**: Generated code matches {specific_patterns} found in {reference_files}
- **Integration Verified**: Changes integrate properly with {existing_systems}
- **Edge Cases**: Handled using established patterns from {reference_implementations}
```

## Key Features

### Pattern Recognition & Following
- Analyzes existing code style, naming conventions, error handling
- Identifies similar features and reuses their approaches
- Maintains consistency with established architectural patterns
- Adapts existing validation and security patterns

### Comprehensive Context Usage
- Reads all relevant files completely before generating spec
- Understands data flow and dependencies between components
- Recognizes integration points and potential conflicts
- Caches full context for immediate implementation

### Quality-Focused Code Generation
- Generated code follows discovered conventions exactly
- Includes appropriate error handling based on existing patterns
- Maintains security and validation approaches from codebase
- Preserves backward compatibility with existing APIs

### Edge Case Coverage
- Identifies edge cases by analyzing how existing code handles similar scenarios
- Applies established error handling and fallback patterns
- Covers null/empty state handling based on existing approaches
- Includes appropriate logging and monitoring based on current patterns

## Interactive Example

### User Input
```
Input: "Add tibial support to reports API"
```

### Auto-Discovery Results
```
Analyzing codebase for "reports API" patterns...

✓ Found app/controllers/reports_controller.rb - main API endpoint
✓ Found app/views/reports/index.jbuilder - response formatting
✓ Located TibialReport model - data source available
✓ Identified user_procedure.is_tibial? - patient type detection method

Existing patterns discovered:
✓ Conditional logic pattern in similar controllers (patients_controller.rb:45)
✓ Report availability logic pattern (reports_controller.rb:78)
✓ Response formatting pattern for different report types (index.jbuilder:12)

Proceed with Express Mode implementation? (Y/N): Y
```

### Generated Spec Preview
```markdown
# Express Implementation: Tibial Reports API Support

## Files Requiring Changes

### app/controllers/reports_controller.rb
**Why**: Main API endpoint needs conditional logic for tibial vs Interstim patients
**Changes**: 
- Add tibial_patient? detection method
- Split index action into tibial/interstim handlers  
- Modify show action for different report models
**Pattern**: Following conditional patient type logic from patients_controller.rb:45-67

### app/views/reports/index.jbuilder
**Why**: Response format differs between tibial and Interstim reports
**Changes**: 
- Conditional title generation (tibial uses report_title column)
- Handle timezone differences between report types
**Pattern**: Adapting conditional view logic from patients/index.jbuilder:23-35

## Implementation Strategy
Extend existing reports controller with conditional branching based on patient type detection,
following established pattern from patients controller where similar patient-type-specific 
logic is handled.

## EARS Acceptance Criteria
1. WHEN API receives /patients/:id/reports for tibial patient THEN system SHALL query TibialReport.where(patient_id: @patient.id) following existing HcpReport pattern
2. IF patient has no tibial reports THEN system SHALL return empty data array with is_report_generation_available flag following existing empty state handling
3. WHEN tibial report generation check requested THEN system SHALL verify baseline + diary summary data following existing availability logic pattern

[Generated code sections follow...]
```

## Success Criteria
- **Implementation Quality**: Code requires <5% manual corrections
- **Pattern Consistency**: Generated code indistinguishable from hand-written following project conventions
- **Time Efficiency**: Complete process under 3 minutes from input to working code
- **Integration Success**: Changes work immediately with existing systems without conflicts

## Limitations
- **Scope**: Only suitable for changes with clear existing patterns
- **Complexity**: Cannot handle novel features or architectural changes  
- **Research**: No research phase - relies entirely on existing codebase patterns
- **Dependencies**: Requires stable, well-established codebase patterns to follow

---

*Express Mode prioritizes speed and pattern consistency for straightforward changes where the path forward is clear from existing code.*