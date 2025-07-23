# AGENTS.md

## Build/Test Commands
- No build system - markdown-based workflow system
- No test commands - documentation validation only
- No lint commands - standard markdown formatting

## Entry Point
- **Primary entry**: `start-workflow.md` - intelligent router for all development work
- Usage: `./start-workflow.md "your request"` or `./start-workflow.md` for interactive mode
- Routes to appropriate workflow based on complexity analysis

## Core Workflow Files (Required)
- `start-workflow.md` - Smart router and complexity analyzer
- `express-spec.md` - 2-3 min workflow for simple changes
- `balanced-spec.md` - 5-8 min workflow for medium complexity
- `comprehensive-spec.md` - 15-25 min workflow for novel features

## Supporting Files (Optional)
- `quick-start.md`, `workflow-utils.md` - Supporting documentation

## File Organization
- Generated docs go in: `tasks/<issue-name>/`
- Express: Single implementation file
- Balanced: Requirements + implementation files
- Comprehensive: Full 4-file documentation suite

## Code Style Guidelines
- Use kebab-case for issue names: `tasks/user-authentication-system/`
- Include time estimates for each workflow mode
- Format questions as numbered lists with contextual options
- Auto-discover existing patterns before creating new code
- Maintain explicit approval gates between phases