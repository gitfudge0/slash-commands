# Concept - Phase 1: Concept Capture & Clarification

## Purpose
Entry point for all workflows. Captures, clarifies, and documents the core problem, opportunity, or idea before moving to detailed requirements.

## Prerequisites Check
- None (this is the entry point)
- Creates `tasks/<issue-name>/` directory if it doesn't exist

## Process

### 1. Issue Name Collection
Prompt for issue name if not provided and validate format (kebab-case).

### 2. Concept Source Identification
Determine source: user idea, GitHub issue, bug report, or enhancement request.

### 3. Interactive Concept Clarification

#### Problem Definition Questions

1. What specific problem are we trying to solve?
   A: Performance issues with slow response times
   B: User experience problems with confusing interface
   C: Security vulnerabilities needing immediate fix
   D: Integration issues with third-party systems
   E: Data inconsistency or corruption issues
   F: Other - please specify

2. Who experiences this problem and how frequently?
   A: End users experience it daily
   B: Internal team encounters it weekly
   C: Customers report it occasionally (monthly)
   D: System administrators notice it during peak times
   E: It affects all users constantly
   F: Other - please specify

3. What is the current workaround or solution?
   A: Users have to refresh/retry manually
   B: We handle it with manual intervention
   C: There's a temporary patch in place
   D: Users avoid certain features/workflows
   E: No current workaround exists
   F: Other - please specify

4. What happens if we don't solve this problem?
   A: User satisfaction will decrease significantly
   B: System performance will continue degrading
   C: Security risks will remain exposed
   D: Business operations will be impacted
   E: Technical debt will accumulate
   F: Other - please specify

#### Solution Approach Questions

1. Do you have a preferred solution approach?
   A: Build a new solution from scratch
   B: Modify/extend existing system
   C: Integrate with third-party solution
   D: Replace current system entirely
   E: Hybrid approach combining multiple methods
   F: Other - please specify

2. Are there any technical constraints we should consider?
   A: Legacy system compatibility requirements
   B: Technology stack limitations
   C: Performance/scalability requirements
   D: Budget/timeline constraints
   E: Team expertise limitations
   F: Other - please specify

3. Are there any existing systems this needs to integrate with?
   A: Database systems
   B: Authentication/authorization systems
   C: Third-party APIs or services
   D: Internal microservices
   E: External vendor systems
   F: Other - please specify

4. What is the current user workflow this affects?
   A: User registration/onboarding process
   B: Daily operational tasks
   C: Administrative functions
   D: Reporting and analytics workflows
   E: Integration or data import/export
   F: Other - please specify

#### Acceptance Criteria Questions

1. How will we know this requirement is complete?
   A: All automated tests pass successfully
   B: User acceptance testing is completed
   C: Performance benchmarks are met
   D: Security audit is passed
   E: Feature works in production environment
   F: Other - please specify

2. What are the testable conditions?
   A: Functional requirements can be verified
   B: Performance metrics can be measured
   C: Security requirements can be validated
   D: User interface behaves as expected
   E: Integration points work correctly
   F: Other - please specify

3. What are the specific behaviors or outcomes expected?
   A: Improved system performance/response times
   B: Enhanced user experience and usability
   C: Reduced error rates or failures
   D: Increased system reliability/availability
   E: Better data accuracy and consistency
   F: Other - please specify

### 4. User Confirmation & Document Generation

Ask user to confirm all gathered information before generating concept document:

**Confirmation Questions:**

1. Please review the problem statement and solution approach. Are they accurate and complete?
   A: Yes, proceed with document generation
   B: Need to revise problem statement
   C: Need to adjust solution approach
   D: Need to revise both problem and solution
   E: Other - please specify

2. Are the constraints and assumptions complete and accurate?
   A: Yes, all constraints and assumptions are captured
   B: Missing technical constraints
   C: Missing business constraints 
   D: Missing assumptions
   E: Other - please specify

3. Are the acceptance criteria well-defined and testable?
   A: Yes, all criteria are clear and testable
   B: Need more specific criteria
   C: Need to add additional criteria
   D: Need to revise existing criteria
   E: Other - please specify
- Generate concept document only after explicit user approval

## Output Files

### `tasks/<issue-name>/01-concept.md`
```markdown
# Concept Document: <Issue Name>

## Problem Statement
[Clear, concise problem description]

## Solution Approach
[High-level solution overview]

## Acceptance Criteria
- [Testable criterion 1]
- [Testable criterion 2] 
- [Testable criterion 3]

## Constraints & Assumptions
### Technical Constraints
- [Constraint 1]
- [Constraint 2]

### Business Constraints
- [Constraint 1]
- [Constraint 2]

### Assumptions
- [Assumption 1]
- [Assumption 2]

## Context & Background
[Additional context, existing systems, current workflows]

## Next Steps
- Proceed to requirements.md for detailed requirement gathering
- Key questions to address in requirements phase: [list]
```

## Integration Points
- **Next Phase**: `requirements.md` will read `tasks/<issue-name>/01-concept.md`
- **Documentation**: Can be supplemented by `doc-generator.md` for project context