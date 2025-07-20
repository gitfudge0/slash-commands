# AGENTS.md - Structured Development System

## Repository Overview
This is a markdown-based workflow system offering a comprehensive 5-phase development process (4.5-10.5 hours total) with interactive questioning, rich documentation, and quality-focused implementation.

## Build/Test Commands
- **No build system** - Pure markdown workflow documentation
- **Testing**: Execute phases in sequence on sample issues
- **Validation**: Each phase validates prerequisites before proceeding
- **Lint**: Manual review of generated markdown structure and content

## Code Style Guidelines
- **File Naming**: Use kebab-case for all files (e.g., `phase-name.md`, `issue-name/`)
- **Markdown Structure**: Use `# Phase Name` for main headings, `## Section`, `### Subsection`
- **Documentation**: Include Mermaid diagrams, ASCII wireframes, structured tables
- **Validation Logic**: Each phase must validate prerequisites and provide clear error messages
- **Interactive Design**: Engage users with comprehensive clarification questions before proceeding
- **Content Standards**: Rich documentation with visual elements, complete coverage, no gaps

## Workflow Execution

### 5-Phase Development Process (4.5-10.5 hours)
1. **concept.md** - Problem definition (30-60 min) → `tasks/<issue>/01-concept.md`
2. **requirements.md** - Detailed specifications (1-3 hours) → Multiple requirement files
3. **design.md** - Technical architecture (2-4 hours) → Design documentation  
4. **tasks.md** - Task breakdown (1-2 hours) → Implementation planning
5. **implement.md** - Interactive execution → Code changes with quality gates

## File Organization
- Generated files: `tasks/<issue-name>/` (kebab-case directories)
- **Workflow files**: `<phase>-<description>.md` (numbered phases 01-05)
- Supporting tools: `doc-generator.md`, `workflow-guide.md`, `quick-start.md`

## Important Rules

### Development Workflow
- **Never skip phases** - Each phase builds critical context for the next
- **Validate prerequisites** - Check required input files exist before proceeding  
- **Interactive validation** - Confirm user understanding before generating outputs
- **Rich documentation** - Use visual elements (Mermaid, ASCII art, tables)
- **Quality gates** - Include validation checkpoints throughout implementation