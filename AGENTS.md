# AGENTS.md - Structured Development System

## Repository Overview
This repository contains a comprehensive 5-phase development workflow system. The system transforms concepts through structured phases to final implementation with rich documentation and interactive quality control.

## Workflow Structure

### 5-Phase Development Process
```
Concept → Requirements → Design → Tasks → Implementation
```

Each phase builds comprehensive documentation and validates prerequisites before proceeding, ensuring thorough planning and quality execution.

## Build/Test Commands
- No build system required (markdown workflow system)
- To test workflows: Use with sample issues following phase sequence
- Validation: Each phase includes built-in prerequisite checking
- Quality: Interactive modes provide continuous validation

## File Structure

### Workflow Commands
- `concept.md` - Phase 1: Problem definition and solution approach
- `requirements.md` - Phase 2: Detailed specifications with user stories  
- `design.md` - Phase 3: Technical architecture and UI design
- `tasks.md` - Phase 4: Granular task breakdown with dependencies
- `implement.md` - Phase 5: Interactive execution with quality gates

### Supporting Tools
- `doc-generator.md` - Independent README.md generation tool
- `workflow.md` - Complete process reference and troubleshooting guide
- `workflow-guide.md` - Usage patterns and decision trees

### Issue Organization
All generated files stored in: `tasks/<issue-name>/`
- `01-concept.md` - Problem definition and success criteria
- `02-*.md` - Requirements, user stories, acceptance criteria  
- `03-*.md` - Technical design, UI specs, API documentation
- `04-*.md` - Task breakdown, timeline, dependencies
- `05-*.md` - Implementation log, code changes, test results

## Code Style Guidelines

### File Naming Conventions
- Workflow commands: `phase-name.md` (kebab-case)
- Issue directories: `tasks/<issue-name>/` (kebab-case)
- Generated files: `<phase>-<description>.md` (numbered phases)

### Documentation Standards
- **Rich Documentation**: Use Mermaid diagrams, ASCII wireframes, structured tables
- **Interactive Questioning**: Comprehensive clarification in each phase
- **Validation Logic**: Each phase validates prerequisites before proceeding
- **Error Handling**: Clear error messages with suggested remediation

### Markdown Conventions
- Use `# Phase Name` for main workflow headings
- Use `## Section` and `### Subsection` for hierarchy
- Include validation logic and error handling in each phase
- Use Mermaid for flowcharts, Gantt charts, architecture diagrams
- Use ASCII art for wireframes and system layouts
- Structure information in tables for clarity

## Content Standards

### Phase Requirements
Each workflow phase must include:
- **Purpose**: Clear description of phase objectives
- **Prerequisites**: Validation of required input files
- **Process**: Interactive questioning and clarification
- **Output Files**: Specific documentation generated
- **Success Criteria**: Measurable completion requirements

### Documentation Quality
- **Comprehensive**: Cover all aspects with no gaps
- **Visual**: Include diagrams and structured information
- **Interactive**: Engage user for clarification and validation
- **Traceable**: Clear links between phases and requirements

### Validation Standards
- **Prerequisite Checking**: Validate required files exist before proceeding
- **User Interaction**: Confirm understanding before moving forward
- **Quality Gates**: Built-in checkpoints throughout implementation
- **Error Recovery**: Clear guidance when validation fails

## Usage Patterns

### Standard Development Flow
1. **concept.md**: Define problem and solution approach (30-60 min)
2. **requirements.md**: Create detailed specifications (1-3 hours)
3. **design.md**: Generate technical architecture (2-4 hours) 
4. **tasks.md**: Break down implementation plan (1-2 hours)
5. **implement.md**: Execute with interactive validation (variable)

### Quality Assurance
- Each phase validates previous phases before starting
- Interactive questioning prevents gaps in understanding
- Rich documentation supports review and validation
- Implementation includes quality gates and testing

### Collaboration Support
- Issue-based organization supports team collaboration
- Generated documentation facilitates stakeholder review
- Multiple issues can be developed in parallel
- Clear prerequisites prevent workflow conflicts

## Key Principles

### Structured Approach
- **Sequential Phases**: Each builds on previous work
- **Comprehensive Documentation**: Rich, visual information at each step
- **Interactive Validation**: User confirmation and clarification throughout
- **Quality Focus**: Built-in gates and validation checkpoints

### User Control
- **Interactive Modes**: Task-by-task approval and modification
- **Flexible Execution**: Choose autonomous, interactive, or custom modes  
- **Iterative Refinement**: Return to earlier phases when needed
- **Decision Points**: User control over approach and implementation

### Documentation Excellence
- **Industry Standards**: Follow best practices for requirements and design
- **Visual Communication**: Mermaid diagrams, ASCII wireframes, structured tables
- **Reusable Context**: Generated documentation serves as team knowledge base
- **Comprehensive Coverage**: All aspects documented for future reference

## Important Guidelines

### Phase Dependencies
- **Never skip phases**: Each phase builds critical context for the next
- **Validate prerequisites**: System enforces proper sequence
- **Complete documentation**: Don't proceed with incomplete phase outputs
- **Review before continuing**: Validate each phase output before proceeding

### Commit Standards
- Commit after each phase completion for progress tracking
- Use descriptive commit messages: "Add requirements for <issue-name>"
- Include generated documentation in commits
- Follow conventional commit format with opencode attribution:

```bash
git commit -m "feat: Add concept for google-oauth-integration

Define problem scope and solution approach for OAuth integration.

🤖 Generated with [opencode](https://opencode.ai)

Co-Authored-By: opencode <noreply@opencode.ai>"
```

### Security and Quality
- **No secrets in documentation**: Keep sensitive information out of generated files  
- **Comprehensive validation**: Use all quality gates and checkpoints
- **Security review**: Include security considerations in design phase
- **Testing integration**: Implementation phase includes comprehensive testing

This structured system provides comprehensive development workflows that ensure thorough planning, rich documentation, and quality implementation through interactive user guidance and validation.