# Smart Development Workflow Router

## Overview
Intelligently routes development requests to the appropriate workflow based on complexity analysis and existing codebase patterns. Optimizes documentation time to match change scope while maintaining implementation quality.

**Goal**: Spend 2-3 minutes on simple changes, 5-8 minutes on medium complexity, 15-25 minutes only on truly novel features.

## Usage

**Interactive Mode:**
```bash
./start-workflow.md
```

**With Input Parameter:**
```bash
./start-workflow.md "Add tibial support to reports API"
./start-workflow.md "PROJ-1234"  
./start-workflow.md "https://github.com/user/repo/issues/123"
./start-workflow.md "https://jira.company.com/browse/PROJ-1234"
```

**Supported Input Types:**
- Brief descriptions
- JIRA ticket numbers (e.g., "PROJ-1234") 
- JIRA URLs
- GitHub issue URLs
- Multi-line requirements (quoted)

## How It Works

### Phase 1: Intelligent Analysis (15-30 seconds)
1. **Input Processing**: Process parameter or prompt for input
2. **Auto-Discovery**: Search codebase for relevant files and patterns
3. **Complexity Scoring**: Analyze novelty, patterns, and integration points
4. **Route Recommendation**: Suggest optimal workflow path

### Phase 2: Workflow Execution
Routes to one of three optimized workflows:
- **Express Mode**: 2-3 minutes for extensions and bug fixes
- **Balanced Mode**: 5-8 minutes for new components with existing patterns  
- **Comprehensive Mode**: 15-25 minutes for novel features requiring research

## Complexity Analysis Algorithm

### Scoring Factors
```
Pattern Recognition:
- Existing similar features found: -2 points
- Existing models can be extended: -1 point
- New domain/technology needed: +3 points
- Architectural changes required: +2 points

Input Clarity:
- Detailed requirements provided: -1 point
- Vague or abstract description: +2 points
- External context (JIRA/GitHub): -1 point

Integration Complexity:
- Touches single component: -1 point
- Affects multiple systems: +2 points
- Requires new infrastructure: +3 points
```

### Routing Decision
- **Score ≤ 0**: Express Mode (express-spec.md)
- **Score 1-2**: Balanced Mode (balanced-spec.md)
- **Score ≥ 3**: Comprehensive Mode (comprehensive-spec.md)

## Interactive Process

### Input Handling
The workflow accepts input in two ways:

1. **Command Parameter** (if provided):
   ```bash
   ./start-workflow.md "Add pagination to user endpoints"
   ```

2. **Interactive Prompt** (if no parameter):
   ```
   What do you want to implement?
   
   Options:
   1. Brief description (e.g., "Add tibial support to reports API")
   2. JIRA ticket URL or number (e.g., "PROJ-1234")  
   3. GitHub issue URL
   4. Copy/paste requirements
   
   Your input: ___
   ```

### Complexity Analysis Results
```
Analyzing your request...

✓ Found existing reports controller patterns
✓ Located TibialReport model in codebase  
✓ Identified integration points with user_procedures
✓ No new architectural patterns needed

Complexity Score: -1
Recommended Workflow: Express Mode (2-3 minutes)

Proceed with Express Mode? (Y/N/suggest-alternative): ___
```

### Workflow Execution
Based on user confirmation, routes to appropriate specialized workflow file.

## Express Mode Preview
**Best for**: Extensions, bug fixes, small modifications
**Time**: 2-3 minutes
**Files created**: 1 (implementation.md with complete spec)
**Process**: Auto-discovery → Implementation spec → Single approval → Direct implementation

## Balanced Mode Preview  
**Best for**: New components, medium complexity features
**Time**: 5-8 minutes
**Files created**: 2 (requirements + implementation plan)
**Process**: Mini-requirements → Pattern analysis → Implementation plan → Code generation

## Comprehensive Mode Preview
**Best for**: Novel features, architectural changes
**Time**: 15-25 minutes  
**Files created**: 4 (requirements + design + tasks + implementation log)
**Process**: Full EARS requirements → Research & design → Task breakdown → Iterative implementation

## Escape Hatches

### Mid-Process Escalation
If complexity emerges during execution:
```
⚠️  This change appears more complex than initially assessed.
   Issues detected: [missing patterns, architectural impact, etc.]
   
Recommended Actions:
A) Continue with current workflow (may require manual corrections)
B) Escalate to Balanced Mode (recommended)
C) Escalate to Comprehensive Mode  

Your choice: ___
```

### Workflow Flexibility
- Can restart with different mode if initial choice doesn't fit
- Context and analysis from previous attempts is preserved  
- User maintains control over process complexity

## Integration Points

### File Organization
All workflows create files in: `tasks/<issue-name>/`
- Express: Single spec file with embedded implementation
- Balanced: Requirements + implementation plan files
- Comprehensive: Full documentation suite (4 files)

### Context Preservation
- Analysis results cached across workflow changes
- File discovery shared between modes
- Pattern recognition reused for consistency

### Quality Assurance
- All modes include explicit approval gates
- Pattern-following code generation
- Existing convention enforcement
- Built-in validation checkpoints

## Examples

### Express Mode Routing
```
Input: "Add pagination to user list endpoint"
Analysis: Found existing pagination patterns in PostsController
Score: -2 (strong existing patterns)
Route: Express Mode
Result: 2-minute implementation following existing patterns
```

### Balanced Mode Routing
```
Input: "Add password reset functionality"  
Analysis: Found email patterns, no existing auth reset flows
Score: +1 (some patterns, new component needed)
Route: Balanced Mode
Result: 6-minute implementation with mini-requirements phase
```

### Comprehensive Mode Routing
```
Input: "Add real-time chat system"
Analysis: No messaging patterns, WebSocket infrastructure needed
Score: +4 (novel domain, new architecture)
Route: Comprehensive Mode  
Result: 20-minute comprehensive design and implementation
```

## Success Metrics
- **Time Efficiency**: Documentation time proportional to change complexity
- **Implementation Quality**: <10% manual corrections needed
- **Pattern Consistency**: Generated code follows existing conventions
- **User Satisfaction**: Right level of process for each change type

---

*This router ensures you spend the minimum time necessary to get high-quality, well-documented implementations that integrate seamlessly with your existing codebase.*