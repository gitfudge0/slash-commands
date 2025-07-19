# AGENTS.md - AI Agent Guidelines

## Repository Overview
This repository contains slash-command documentation for AI agents. Each .md file defines a specific agent workflow.

## Build/Test Commands
- No build system detected (markdown-only repository)
- No test suite found
- No lint configuration present
- To test: Manually validate markdown syntax and workflow completeness

## Code Style Guidelines

### File Structure
- All command files use `.md` extension
- Follow kebab-case for filenames (e.g., `idea-to-prd.md`)
- Place task outputs in `tasks/{task-name}/` directories

### Markdown Conventions
- Use `# Title` for main headings
- Use `## Section` and `### Subsection` for hierarchy
- Code blocks use triple backticks with language specification
- Use bullet points for lists, numbered lists for processes
- Include usage examples in each command file

### Content Standards
- Each command file must have: Purpose, Usage, Process sections
- Include specific bash commands in code blocks
- Use HEREDOC format for git commit messages
- Follow conventional commit types (feat, fix, docs, etc.)
- Always include the opencode attribution footer in commits
- Never modify git config or push to remote without explicit approval

### Documentation Requirements
- Keep workflows concise but comprehensive
- Include validation steps for each process
- Provide clear examples and templates
- Document all stakeholder considerations and requirements