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

**Question Format Instructions for LLM:**
Present each question as a numbered item with contextual multiple-choice answers (A-F) generated from the user's provided context. Always include "F: Other - please specify" as the final option. Users respond with codes like "1-B", "2-A,C", etc.

#### Problem Definition Questions
- What specific problem are we trying to solve?
- Who experiences this problem and how frequently?
- What is the current workaround or solution?
- What happens if we don't solve this problem?

#### Solution Approach Questions
- Do you have a preferred solution approach?
- Are there any technical constraints we should consider?
- Are there any existing systems this needs to integrate with?
- What is the current user workflow this affects?

#### Acceptance Criteria Questions
- How will we know this requirement is complete?
- What are the testable conditions?
- What are the specific behaviors or outcomes expected?

### 4. User Confirmation & Document Generation

**Confirmation Format Instructions for LLM:**
Present confirmation questions in the same numbered format with contextual Yes/No/Other options.

Ask user to confirm all gathered information before generating concept document:
- Review problem statement and solution approach
- Confirm constraints and assumptions are complete
- Verify acceptance criteria are well-defined
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