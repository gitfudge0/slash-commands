# Balanced Development Workflow

## Overview
Mid-complexity workflow for new components that leverage some existing patterns but require targeted requirements gathering. Balances speed with systematic planning.

**Target Time**: 5-8 minutes total
**Best For**: New components using existing infrastructure, features with some unknowns, medium-complexity integrations

## Prerequisites
- Routed here by start-workflow.md with complexity score 1-2
- Some existing patterns found but gaps identified
- Moderate scope with manageable unknowns

## Process

### Phase 1: Smart Requirements (2-3 minutes)
Generate focused requirements using EARS format, targeting only the essential unknowns while leveraging existing patterns.

### Phase 2: Pattern-Informed Implementation Plan (2-3 minutes)  
Create implementation strategy that adapts existing patterns and identifies new components needed.

### Phase 3: Guided Implementation (1-2 minutes)
Generate code using combined requirements and pattern analysis.

## Generated Files

Creates two files in `tasks/{issue-name}/`:
1. `balanced-requirements.md` - Focused EARS requirements
2. `balanced-implementation.md` - Implementation plan with generated code

## Phase 1: Smart Requirements

### Interactive Requirements Gathering
```
Based on your request and codebase analysis, I need clarification on these key areas:

Question Group 1: Core Functionality (2-3 questions)
1. {Targeted question about main functionality}
   A) {Option based on existing pattern}
   B) {Alternative approach seen in codebase}  
   C) {New approach needed}
   D) Other, I'll specify

2. {Question about data handling}
   A) {Follow existing model pattern}
   B) {Adapt similar model structure}
   C) {Create new model structure}

Question Group 2: Integration Points (1-2 questions)  
3. {Question about how it connects to existing systems}
   A) {Use existing integration pattern}
   B) {Modify existing integration}
   C) {Create new integration}

Your answers: 1-A, 2-B, 3-A
```

### Balanced Requirements Template

```markdown
# Balanced Requirements: {Feature Name}

## Feature Overview
{Brief description based on user input and clarification}

## Pattern Analysis
**Existing Patterns Leveraged**:
- {Pattern 1}: Found in {location} - Will adapt for {specific use}
- {Pattern 2}: Used by {similar feature} - Will follow for {aspect}

**New Patterns Needed**:
- {New pattern 1}: No existing equivalent, will create following {framework conventions}
- {New pattern 2}: Extension of {existing pattern} with {specific modifications}

## Core Requirements (EARS Format)

### Requirement 1: {Core Functionality}
**User Story**: As a {role}, I want {functionality}, so that {benefit}

**Acceptance Criteria**:
1. WHEN {specific trigger} THEN system SHALL {specific response} following {existing pattern reference}
2. IF {precondition identified from existing code} THEN system SHALL {expected behavior} consistent with {similar feature}
3. WHEN {edge case from pattern analysis} THEN system SHALL {fallback behavior} using {established error pattern}

### Requirement 2: {Integration Requirement}  
**User Story**: As a {role}, I want {integration capability}, so that {benefit}

**Acceptance Criteria**:
1. WHEN {integration event} THEN system SHALL {integration response} adapting {existing integration pattern}
2. IF {integration failure condition} THEN system SHALL {failure handling} following {current error handling approach}

### Requirement 3: {Data/State Management}
**User Story**: As a {role}, I want {data management capability}, so that {benefit}

**Acceptance Criteria**:
1. WHEN {data operation} THEN system SHALL {data handling} using {existing data pattern}
2. WHEN {validation scenario} THEN system SHALL {validation response} consistent with {existing validation approach}

## Success Criteria
- {Measurable outcome 1 based on existing similar features}
- {Measurable outcome 2 following established patterns}
- {Performance/quality criteria matching existing standards}

## Assumptions & Constraints
**Assumptions**:
- {Assumption 1 based on existing patterns}
- {Assumption 2 from current system architecture}

**Constraints**:  
- Must follow {existing security pattern}
- Must integrate with {existing system component}
- Must maintain {existing performance standard}
```

## Phase 2: Pattern-Informed Implementation Plan

### Balanced Implementation Template

```markdown
# Balanced Implementation Plan: {Feature Name}

## Architecture Strategy
**Pattern Adaptation Approach**:
- Leverage {existing pattern 1} from {location} for {specific aspect}
- Adapt {existing pattern 2} from {similar feature} for {integration}
- Create new {component type} following {framework convention} for {novel aspect}

**Integration Philosophy**:
{How new components will integrate with existing architecture}

## Component Analysis

### New Components Needed
1. **{Component 1}** ({file path})
   - **Purpose**: {What it does}
   - **Pattern**: New component following {existing component pattern}  
   - **Dependencies**: {Existing components it uses}

2. **{Component 2}** ({file path})
   - **Purpose**: {What it does}
   - **Pattern**: Adaptation of {existing similar component}
   - **Dependencies**: {Integration points}

### Modified Components
1. **{Existing Component}** ({file path})
   - **Changes**: {Specific modifications needed}
   - **Pattern**: Extend existing {pattern type} with {additional functionality}
   - **Risk**: {Potential impact assessment}

## Implementation Tasks

### Phase A: Foundation (Estimated: 60% of work)
- [ ] **Task A1**: Create {core component} following {pattern reference}
  - Implement {specific functionality} adapting {existing approach}
  - Add {validation/error handling} using {established pattern}
  - **Requirements**: {Links to specific requirements}

- [ ] **Task A2**: Extend {existing component} with {new capability}
  - Modify {specific methods/functions} following {modification pattern}
  - Maintain backward compatibility with {existing functionality}
  - **Requirements**: {Links to specific requirements}

### Phase B: Integration (Estimated: 30% of work)  
- [ ] **Task B1**: Connect {new component} to {existing system}
  - Implement {integration pattern} following {existing integration example}
  - Add {configuration/setup} consistent with {current setup approach}
  - **Requirements**: {Links to specific requirements}

### Phase C: Validation (Estimated: 10% of work)
- [ ] **Task C1**: Add comprehensive testing
  - Create {test types} following {existing test pattern}
  - Validate {integration points} using {current testing approach}
  - **Requirements**: {Links to all requirements}

## Generated Implementation

### {New Component File Path}
```{language}
{Generated code following identified patterns and requirements}
```

### {Modified Component File Path}  
```{language}
{Generated modifications with clear integration points}
```

### {Additional Files}
```{language}
{Supporting code, configs, or tests following project conventions}
```

## Quality Validation

### Pattern Consistency Checklist
- [ ] Follows {specific code style} found in {reference files}
- [ ] Uses {established naming convention} from {similar components}
- [ ] Implements {error handling pattern} consistent with {existing approach}
- [ ] Integrates with {authentication/authorization} following {current security pattern}

### Requirements Validation  
- [ ] Requirement 1: {Verification approach}
- [ ] Requirement 2: {Testing strategy}  
- [ ] Requirement 3: {Validation method}

### Integration Testing
- [ ] {Integration point 1}: {Test approach}
- [ ] {Integration point 2}: {Validation strategy}
- [ ] Backward compatibility: {Verification method}

## Post-Implementation Notes
**Key Decisions Made**:
- {Decision 1}: Chose {approach} because {reasoning based on existing patterns}
- {Decision 2}: Adapted {pattern} instead of {alternative} due to {consistency with existing code}

**Future Considerations**:
- {Potential enhancement 1} could follow {existing expansion pattern}
- {Potential modification} would require updating {related components}
```

## Key Features

### Smart Requirements Generation
- **Targeted Questions**: Only asks about aspects not inferable from existing patterns
- **Pattern-Informed Options**: Multiple choice answers based on existing codebase approaches
- **Context-Aware EARS**: Requirements reference specific existing patterns and integration points
- **Minimal Question Count**: 3-5 focused questions instead of comprehensive surveys

### Pattern-Informed Implementation
- **Existing Pattern Analysis**: Deep understanding of current code conventions and approaches
- **Selective Adaptation**: Reuses established patterns where applicable, creates new ones only when necessary
- **Integration Awareness**: Understands how new components connect to existing architecture
- **Risk Assessment**: Identifies potential impacts on existing functionality

### Quality Assurance
- **Two Approval Gates**: Requirements approval, then implementation plan approval
- **Pattern Consistency Validation**: Generated code matches existing conventions
- **Integration Testing**: Validates connections to existing systems
- **Backward Compatibility**: Ensures existing functionality remains intact

## Interactive Example

### User Input
```
Input: "Add password reset functionality to user authentication system"
```

### Smart Requirements Session
```
I found existing authentication patterns but no password reset functionality.

Question Group 1: Reset Flow Design
1. How should users initiate password reset?
   A) Email link (following existing email pattern from user registration)
   B) SMS code (no existing SMS pattern found)
   C) Security questions (no existing pattern found)
   
2. How long should reset tokens be valid?
   A) 1 hour (following existing session timeout pattern)
   B) 24 hours (following existing email verification pattern)
   C) Custom duration

Your answers: 1-A, 2-B

Question Group 2: Integration Points
3. Where should reset links redirect after success?
   A) Login page (existing route /login)
   B) Dashboard (existing route /dashboard)  
   C) Custom success page

Your answer: 3-A

Generating requirements based on existing email and authentication patterns...
```

### Generated Requirements Preview
```markdown
## Core Requirements (EARS Format)

### Requirement 1: Password Reset Initiation
**User Story**: As a user, I want to request a password reset via email, so that I can regain access to my account

**Acceptance Criteria**:
1. WHEN user submits email on /forgot-password THEN system SHALL generate secure token following existing email_verification_token pattern from User model
2. IF email exists in system THEN system SHALL send reset email using existing UserMailer pattern from registration flow
3. WHEN token expires (24 hours) THEN system SHALL invalidate reset attempt following existing email_verification expiration logic
```

## Success Criteria
- **Requirements Quality**: Comprehensive coverage with minimal clarification rounds
- **Implementation Efficiency**: Generated code requires <15% manual corrections
- **Pattern Consistency**: New components indistinguishable from existing codebase style
- **Time Management**: Complete process under 8 minutes from input to working code

## Limitations
- **Scope**: Cannot handle completely novel domains without any existing patterns
- **Complexity**: May escalate to comprehensive mode if unknowns exceed manageable scope
- **Research**: Limited research capability - focuses on pattern adaptation rather than novel approaches

---

*Balanced Mode provides the optimal middle ground between speed and thoroughness for features that need some planning but can leverage existing architectural patterns.*