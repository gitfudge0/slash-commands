# Express Workflow - 5-15 Minute Development Start

**Purpose**: Get from idea to implementation in 5-15 minutes instead of 4.5-10.5 hours.

## Usage
```bash
./express.md
```

## Process
You provide:
1. **Issue name** (kebab-case)
2. **Brief problem description** (1-2 sentences)
3. **Preferred approach** (optional - I'll suggest if not provided)

I generate in **one shot**:
- Concept summary
- Key requirements 
- Technical approach
- Implementation tasks
- Ready-to-code plan

**Time investment: 5-15 minutes total**

## Implementation

When you run this command, I will:

1. **Collect minimal input** (2-3 questions max):
   - What's the issue name?
   - What problem are you solving?
   - Any specific technical preferences?

2. **Generate streamlined docs** in `tasks/<issue-name>/`:
   - `express-plan.md` - Everything in one concise file
   - Skip interactive questioning
   - Skip user confirmation gates
   - Skip rich documentation (Mermaid, wireframes, etc.)
   - Focus on actionable implementation plan

3. **Output implementation-ready tasks**:
   - Clear, ordered task list
   - Key technical decisions made
   - Ready to start coding immediately

## File Structure
```
tasks/<issue-name>/
└── express-plan.md    # Everything in one file
```

## Express Plan Template
The generated `express-plan.md` contains:

```markdown
# <Issue Name> - Express Plan

## Problem
Brief problem statement

## Solution Approach  
High-level technical approach

## Key Requirements
- 3-5 bullet points max
- Focus on must-haves only

## Technical Decisions
- Framework/library choices
- Architecture approach
- Data storage approach

## Implementation Tasks
1. [ ] Task 1
2. [ ] Task 2  
3. [ ] Task 3
...

## Acceptance Criteria
- Works as expected
- Basic testing done
- Ready for review

## Estimated Time: X hours
```

## When to Use Express vs Full Workflow

### Use Express (5-15 min) when:
- You know what you want to build
- Simple to medium complexity
- Want to start coding quickly
- Time is a priority

### Use Full Workflow (4.5-10.5 hours) when:
- Complex system design needed
- Multiple stakeholders involved
- Unclear requirements
- High-risk implementation
- UI-heavy with design needs

## Express Workflow Implementation

Ready to transform your development speed? Run this command and provide minimal input for maximum output.