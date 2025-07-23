# Quick Start Guide

## Overview
Get started with the Smart Development Workflow system in under 2 minutes. This guide walks you through your first implementation using the hybrid workflow approach.

## TL;DR
```bash
./start-workflow.md    # Start here - analyzes your request and routes to optimal workflow
```

**Result**: Spend 2-3 minutes on simple changes, 5-8 minutes on medium complexity, 15-25 minutes only on complex features.

## First Run Example

### Step 1: Start the Workflow
```bash
./start-workflow.md
```

**Or with direct input:**
```bash
./start-workflow.md "Add pagination to user list endpoint"
```

### Step 2: Provide Your Request  
```
What do you want to implement?

Your input: Add pagination to user list endpoint
```

### Step 3: Review Auto-Analysis
```
Analyzing your request...

✓ Found existing pagination patterns in PostsController  
✓ Located user list endpoint in UsersController
✓ Identified page_size parameter pattern
✓ No new architectural patterns needed

Complexity Score: -2
Recommended Workflow: Express Mode (2-3 minutes)

Proceed with Express Mode? (Y): Y
```

### Step 4: Confirm Scope
```
Files identified for modification:
✓ app/controllers/users_controller.rb - Add pagination logic
✓ app/views/users/index.jbuilder - Add pagination metadata

Patterns found:
✓ Kaminari pagination from PostsController#index
✓ Pagination metadata from posts/index.jbuilder

Confirm scope (Y): Y
```

### Step 5: Review Implementation Spec
```
# Express Implementation: User List Pagination

## Files Requiring Changes

### app/controllers/users_controller.rb
**Why**: Add pagination to index action
**Changes**: Add .page(params[:page]).per(params[:page_size] || 20)
**Pattern**: Following Kaminari pattern from PostsController#index:42

### app/views/users/index.jbuilder  
**Why**: Include pagination metadata in response
**Changes**: Add pagination object with total_pages, current_page, total_count
**Pattern**: Following pagination metadata from posts/index.jbuilder:56-62

[Generated implementation code follows...]

Approve implementation and generate code? (Y): Y
```

### Step 6: Code Generated
```
✓ Modified app/controllers/users_controller.rb
✓ Updated app/views/users/index.jbuilder
✓ Applied consistent code style and patterns
✓ Included appropriate error handling

Implementation complete! Files modified: 2
Total time: 2 minutes 15 seconds
```

## Workflow Modes Explained

### Express Mode (2-3 minutes)
**When**: Extensions, bug fixes, features with clear existing patterns
**Process**: Auto-discovery → Implementation spec → Code generation
**Files**: 1 file with complete spec and implementation

**Example Triggers**:
- "Add tibial support to reports API" 
- "Add sorting to products list"
- "Fix validation error messages"

### Balanced Mode (5-8 minutes)  
**When**: New components using existing infrastructure, medium complexity
**Process**: Mini-requirements → Implementation plan → Code generation
**Files**: 2 files (requirements + implementation plan)

**Example Triggers**:
- "Add password reset functionality"
- "Add file upload to user profiles" 
- "Add email notifications system"

### Comprehensive Mode (15-25 minutes)
**When**: Novel features, architectural changes, complex integrations
**Process**: Full requirements → Research & design → Task breakdown → Implementation
**Files**: 4 files (requirements + design + tasks + execution log)

**Example Triggers**:
- "Add real-time chat system"
- "Add payment processing"
- "Add machine learning recommendations"

## Common Scenarios

### Scenario 1: Simple API Extension
```
Input: "Add search filter to products API"
Analysis: Found existing filtering patterns
Route: Express Mode
Time: 2 minutes
Output: Working search filter following existing patterns
```

### Scenario 2: New Feature with Some Patterns
```
Input: "Add two-factor authentication"  
Analysis: Found auth patterns, no 2FA patterns
Route: Balanced Mode
Time: 6 minutes
Output: Complete 2FA system with SMS/TOTP options
```

### Scenario 3: Complex New Domain
```
Input: "Add inventory management system"
Analysis: No existing inventory patterns, new domain
Route: Comprehensive Mode  
Time: 22 minutes
Output: Full inventory system with comprehensive documentation
```

## Tips for Best Results

### Provide Good Input
**Good**: "Add pagination to user list endpoint"
**Better**: "Add pagination to /api/users endpoint with page size limits"
**Best**: "Add pagination to /api/users endpoint following existing pattern from posts, with 20 items per page default"

### Use External Context
**Even Better**: Provide JIRA ticket URL or GitHub issue link
```
Input: https://company.atlassian.net/browse/PROJ-123
Analysis: Auto-extracts requirements and acceptance criteria
Result: Faster, more accurate implementation
```

### Know When to Escalate
If Express Mode seems insufficient:
```
⚠️  This change appears more complex than initially assessed.

Recommended Actions:
A) Continue with Express Mode (may need manual corrections)
B) Escalate to Balanced Mode (recommended)  
C) Escalate to Comprehensive Mode

Your choice: B
```

## File Organization

All generated files go in: `tasks/{issue-name}/`

### Express Mode Output
```
tasks/add-user-pagination/
└── express-spec.md       # Complete spec with implementation
```

### Balanced Mode Output  
```
tasks/add-password-reset/
├── balanced-requirements.md     # Focused requirements
└── balanced-implementation.md   # Implementation plan + code
```

### Comprehensive Mode Output
```
tasks/add-chat-system/
├── comprehensive-requirements.md  # Full EARS requirements
├── comprehensive-design.md        # Technical architecture
├── comprehensive-tasks.md         # Task breakdown
└── comprehensive-log.md          # Implementation execution
```

## Integration with Development Workflow

### With Existing Tools
- **Git**: All files are markdown, commit-friendly
- **IDEs**: Copy generated code directly into your editor
- **CI/CD**: Generated code follows existing patterns and passes existing quality gates
- **Documentation**: All decisions and reasoning preserved in markdown

### Quality Assurance
Every workflow mode includes:
- **Pattern Following**: Generated code matches existing conventions
- **Error Handling**: Appropriate error handling based on existing patterns  
- **Testing Strategy**: Recommendations for testing generated code
- **Integration Validation**: Ensures changes work with existing systems

## Troubleshooting

### Wrong Workflow Chosen
```
If you realize mid-process that you need a different workflow:

"This seems more complex than Express Mode can handle"
→ System offers to escalate to Balanced or Comprehensive Mode
→ Previous analysis is preserved and reused
```

### Generated Code Needs Tweaks
```
Express Mode: <5% manual corrections expected
Balanced Mode: <10% manual corrections expected  
Comprehensive Mode: <2% manual corrections expected

If you need more corrections, consider:
- Using a more comprehensive workflow mode next time
- Providing more detailed input requirements
- Including external context (JIRA/GitHub links)
```

### Need to Modify Existing Implementation
```
Use the same workflow to modify:

Input: "Update the user pagination to support sorting"
Analysis: Found recent pagination implementation  
Route: Express Mode (builds on existing work)
Result: Enhanced pagination with sorting
```

## Next Steps

### After Your First Success
1. **Try Different Modes**: Experiment with Balanced and Comprehensive modes
2. **Use External Context**: Try providing JIRA/GitHub URLs
3. **Build Complex Features**: Use Comprehensive mode for novel features
4. **Customize Patterns**: The system learns from your codebase patterns

### Integration Tips
- **Team Usage**: Share generated specs with team members for review
- **Documentation**: Keep generated files as feature documentation
- **Maintenance**: Use workflow to modify and extend implemented features
- **Knowledge Base**: Generated files serve as team knowledge repository

---

**Ready to start?** Run `./start-workflow.md` and describe what you want to implement!

*The system will automatically choose the right level of process for your specific request, ensuring you spend minimal time on documentation while getting maximum implementation quality.*