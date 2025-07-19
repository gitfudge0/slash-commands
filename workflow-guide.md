# Workflow Guide - Which Command to Use and When

## Quick Reference

### Starting Points
- **New Feature Idea** → `idea-to-prd.md`
- **Existing Issue/Bug** → `issue-to-prd.md`
- **UI/Frontend Work** → `ui-flow-engineer.md`

### Implementation Phase
- **PRD Ready** → `prd-to-tasks.md`
- **Task Implementation** → `process-task.md`

### Quality Assurance
- **Any Workflow** → `validate-and-iterate.md` (use alongside other commands)

## Complete Workflows

### 1. Feature Development Flow
```
idea-to-prd.md → prd-to-tasks.md → process-task.md
```
**When to use**: Starting with a new feature concept or enhancement idea

**Process**:
1. Transform idea into structured PRD with stakeholder analysis
2. Generate Technical Design Document and break into tasks
3. Implement tasks with optional iterative validation

### 2. Issue Resolution Flow
```
issue-to-prd.md → prd-to-tasks.md → process-task.md
```
**When to use**: Addressing bugs, technical debt, or reported issues

**Process**:
1. Analyze issue and create solution-focused PRD
2. Generate technical implementation plan and tasks
3. Execute fixes with validation steps

### 3. UI/Frontend Development Flow
```
ui-flow-engineer.md → validate-and-iterate.md
```
**When to use**: Creating new UI components, pages, or design systems

**Process**:
1. Interactive 4-phase design (Layout → Theme → Animation → Implementation)
2. Quality validation with user feedback and refinement

### 4. Standalone Task Flow
```
process-task.md
```
**When to use**: Working on pre-defined tasks or quick implementations

**Modes**:
- **Autonomous**: Direct implementation
- **Iterative**: Phase-by-phase validation with user approval

## Integration Patterns

### Quality-First Approach
Add `validate-and-iterate.md` to any workflow:
```
[any-workflow] + validate-and-iterate.md
```
Use 1-10 scoring system for continuous quality improvement

### UI-Enhanced Feature Development
For features with significant UI components:
```
idea-to-prd.md → ui-flow-engineer.md → prd-to-tasks.md → process-task.md
```

### Technical Debt Resolution
For architecture improvements:
```
issue-to-prd.md → prd-to-tasks.md (emphasize TDD) → process-task.md (iterative mode)
```

## Decision Tree

### Start Here: What are you working on?

**🎯 New Feature/Enhancement**
- Business requirement? → `idea-to-prd.md`
- UI/Design heavy? → `ui-flow-engineer.md`
- Technical architecture? → `idea-to-prd.md` + detailed TDD

**🐛 Bug/Issue/Problem**
- Reported issue? → `issue-to-prd.md`
- Quick fix? → `process-task.md` (autonomous)
- Complex root cause? → `issue-to-prd.md` → iterative flow

**💻 Implementation Work**
- Have PRD? → `prd-to-tasks.md`
- Have tasks? → `process-task.md`
- Need design? → `ui-flow-engineer.md`

**🔍 Quality/Refinement**
- Any deliverable → `validate-and-iterate.md`

## Command Characteristics

| Command | Input Required | Output | Interactive | Best For |
|---------|---------------|--------|-------------|----------|
| `idea-to-prd.md` | Feature idea | Structured PRD | Yes | Business requirements |
| `issue-to-prd.md` | Issue description | Solution PRD | Yes | Problem solving |
| `ui-flow-engineer.md` | UI requirements | Complete UI implementation | Yes | Frontend development |
| `prd-to-tasks.md` | PRD document | TDD + Task list | Minimal | Technical planning |
| `process-task.md` | Task description | Implementation | Optional | Development execution |
| `validate-and-iterate.md` | Any deliverable | Quality report + improvements | Yes | Quality assurance |

## Usage Tips

### For Teams
- **Product Managers**: Start with `idea-to-prd.md` or `issue-to-prd.md`
- **Designers**: Use `ui-flow-engineer.md` for interactive design iteration
- **Developers**: Jump to `process-task.md` for implementation, use iterative mode for complex work
- **QA**: Apply `validate-and-iterate.md` to any deliverable for structured testing

### For Solo Development
1. **Quick wins**: `process-task.md` (autonomous mode)
2. **New features**: Full flow with `idea-to-prd.md`
3. **UI work**: Always use `ui-flow-engineer.md` for better design outcomes
4. **Quality focus**: Add validation step to any workflow

### Best Practices
- **Always use TDD step**: Don't skip technical design in `prd-to-tasks.md`
- **Choose your mode**: Autonomous for speed, Iterative for quality
- **Validate early**: Use `validate-and-iterate.md` on early deliverables
- **Document decisions**: Each command creates documentation for future reference