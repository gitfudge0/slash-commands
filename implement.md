# Implement - Phase 5: Interactive Implementation & Execution

## Purpose
Execute tasks with user validation and approval at each step. Provides both autonomous and interactive modes for task-by-task implementation.

## Usage
```bash
/implement
```

## Input Parameters
- **Issue name**: `<issue-name>` (will prompt if not provided)
- **Execution mode**: Interactive (default) or Autonomous

## Prerequisites Check
- **REQUIRED**: All files from phases 1-4
- **Pattern**: `tasks/<issue-name>/01-*.md` through `tasks/<issue-name>/04-*.md`

## Validation Logic
```bash
# Validate issue name provided
if [ -z "$issue_name" ]; then
    echo "Enter issue name for implementation phase:"
    read -p "Issue name: " issue_name
fi

# Check all required phases exist
required_phases=("01" "02" "03" "04")
for phase in "${required_phases[@]}"; do
    phase_files=($(ls tasks/$issue_name/$phase-*.md 2>/dev/null))
    if [ ${#phase_files[@]} -eq 0 ]; then
        phase_name=""
        case $phase in
            "01") phase_name="concept" ;;
            "02") phase_name="requirements" ;;  
            "03") phase_name="design" ;;
            "04") phase_name="tasks" ;;
        esac
        echo "❌ Error: Phase $phase ($phase_name) incomplete for issue: $issue_name"
        echo "📋 Missing files pattern: tasks/$issue_name/$phase-*.md"
        echo "🔧 Complete missing phase: $phase_name.md"
        echo ""
        echo "📋 Complete workflow order:"
        echo "  concept.md → requirements.md → design.md → tasks.md → implement.md"
        exit 1
    fi
done

# Load comprehensive project context
echo "✅ Prerequisites validated. Loading comprehensive context..."
all_docs=($(ls tasks/$issue_name/{01,02,03,04}-*.md 2>/dev/null))
echo "📄 Found ${#all_docs[@]} documentation files"

# Parse task breakdown for execution planning
task_file="tasks/$issue_name/04-task-breakdown.md"
if [ ! -f "$task_file" ]; then
    echo "❌ Error: Task breakdown file missing: $task_file"
    echo "🔧 Run tasks.md to create task breakdown first"
    exit 1
fi

echo "📋 Parsing task breakdown for execution..."
```

## Process

### 1. Execution Mode Selection
```bash
echo ""
echo "🚀 IMPLEMENTATION MODE SELECTION"
echo "Choose your implementation approach:"
echo ""
echo "1. 📋 Interactive Mode (Recommended)"
echo "   - Execute one task at a time"
echo "   - Review and approve each step" 
echo "   - Modify approach based on results"
echo "   - Maximum control and quality assurance"
echo ""
echo "2. ⚡ Autonomous Mode"
echo "   - Execute all tasks automatically"
echo "   - Faster but less control"
echo "   - Use when confidence is high"
echo ""
echo "3. 🎯 Custom Task Selection"
echo "   - Choose specific tasks to execute"
echo "   - Skip or reorder as needed"
echo "   - Ideal for partial implementations"
echo ""

read -p "Select mode (1-3): " mode_choice

case $mode_choice in
    1)
        echo "📋 Interactive Mode selected - maximum control and quality"
        execution_mode="interactive"
        ;;
    2)
        echo "⚡ Autonomous Mode selected - fast execution"
        echo "⚠️  Warning: Limited oversight and control"
        read -p "Are you sure? This will implement all tasks automatically (y/n): " confirm
        if [ "$confirm" != "y" ]; then
            echo "Switching to Interactive Mode for safety"
            execution_mode="interactive"
        else
            execution_mode="autonomous"
        fi
        ;;
    3)
        echo "🎯 Custom Task Selection - choose your tasks"
        execution_mode="custom"
        ;;
    *)
        echo "Invalid selection, defaulting to Interactive Mode"
        execution_mode="interactive"
        ;;
esac
```

### 2. Task Analysis & Planning
```bash
# Parse and analyze tasks from breakdown document
echo "🔍 Analyzing task structure and dependencies..."

# Extract tasks using grep and parsing
tasks=($(grep -n "^#### TASK-" tasks/$issue_name/04-task-breakdown.md | cut -d: -f1))
echo "📊 Found ${#tasks[@]} tasks in breakdown document"

# Analyze task dependencies and priorities
echo "🔗 Analyzing task dependencies and critical path..."
critical_path_tasks=($(grep -A5 "Critical Path" tasks/$issue_name/04-task-breakdown.md | grep "TASK-" | cut -d: -f1))

# Display task overview
echo ""
echo "📋 TASK OVERVIEW"
echo "==============="
for i in "${!tasks[@]}"; do
    task_line=${tasks[$i]}
    task_info=$(sed -n "${task_line}p" tasks/$issue_name/04-task-breakdown.md)
    echo "$((i+1)). $task_info"
done
```

### 3. Interactive Implementation Flow

#### Task-by-Task Execution (Interactive Mode)
```bash
if [ "$execution_mode" = "interactive" ]; then
    echo ""
    echo "🎯 INTERACTIVE IMPLEMENTATION"
    echo "=============================="
    echo "You will review and approve each task before execution."
    echo "You can modify, skip, or iterate on any task."
    echo ""
    
    for i in "${!tasks[@]}"; do
        task_number=$((i+1))
        task_line=${tasks[$i]}
        
        echo ""
        echo "📋 TASK $task_number of ${#tasks[@]}"
        echo "===================="
        
        # Display task details
        display_task_details "$task_line" "$issue_name"
        
        # Get user approval  
        echo ""
        echo "Options:"
        echo "1. ✅ Execute this task"
        echo "2. ✏️  Modify task approach"
        echo "3. ⏭️  Skip this task"
        echo "4. 🔄 Review task again"
        echo "5. 🛑 Stop implementation"
        
        while true; do
            read -p "Select option (1-5): " task_choice
            
            case $task_choice in
                1)
                    echo "✅ Executing task..."
                    execute_task "$task_line" "$issue_name" "$task_number"
                    break
                    ;;
                2)
                    echo "✏️ Modifying task approach..."
                    modify_task_approach "$task_line" "$issue_name"
                    ;;
                3)
                    echo "⏭️ Skipping task..."
                    log_task_skip "$task_line" "$issue_name" "$task_number"
                    break
                    ;;
                4)
                    echo "🔄 Reviewing task details again..."
                    display_task_details "$task_line" "$issue_name"
                    ;;
                5)
                    echo "🛑 Implementation stopped by user"
                    echo "Progress saved to: tasks/$issue_name/05-implementation-log.md"
                    exit 0
                    ;;
                *)
                    echo "Invalid option. Please select 1-5."
                    ;;
            esac
        done
        
        # Post-task validation
        echo ""
        echo "✅ Task $task_number completed"
        read -p "Press Enter to continue to next task..."
    done
fi
```

#### Autonomous Execution Mode
```bash
if [ "$execution_mode" = "autonomous" ]; then
    echo ""
    echo "⚡ AUTONOMOUS IMPLEMENTATION"
    echo "=========================="
    echo "Executing all tasks automatically..."
    echo "Progress will be logged and can be monitored."
    echo ""
    
    for i in "${!tasks[@]}"; do
        task_number=$((i+1))
        task_line=${tasks[$i]}
        
        echo "🔄 Executing Task $task_number of ${#tasks[@]}..."
        execute_task "$task_line" "$issue_name" "$task_number"
        
        echo "✅ Task $task_number completed"
        echo ""
    done
    
    echo "🎉 All tasks completed automatically!"
fi
```

### 4. Task Execution Functions

#### Task Detail Display
```bash
function display_task_details() {
    local task_line=$1
    local issue_name=$2
    
    # Extract task information from breakdown file
    echo "📖 Loading task details from documentation..."
    
    # Show task title, effort, dependencies, and description
    echo ""
    echo "🏷️  Task Details:"
    sed -n "${task_line},/^---/p" "tasks/$issue_name/04-task-breakdown.md" | head -20
    
    echo ""
    echo "📊 Implementation Context:"
    echo "  - All previous documentation available"
    echo "  - Design specifications loaded"
    echo "  - Dependencies analyzed"
}
```

#### Code Generation & Implementation
```bash
function execute_task() {
    local task_line=$1
    local issue_name=$2
    local task_number=$3
    
    echo "🚀 Starting implementation for Task $task_number..."
    
    # Load all context for code generation
    context_files=($(ls tasks/$issue_name/{01,02,03,04}-*.md))
    
    echo "📖 Loading context from ${#context_files[@]} documentation files..."
    
    # Generate implementation based on task requirements
    echo "🔨 Generating code and implementation..."
    
    # This is where the actual code generation would happen
    # Based on all the loaded context and specific task requirements
    
    # Example implementation steps:
    case $task_number in
        1)
            echo "🗄️  Setting up database schema..."
            # Generate database migration files
            # Create schema based on design documents
            ;;
        2)
            echo "🔐 Creating authentication service..."
            # Generate Express.js authentication service
            # Implement JWT handling based on security design
            ;;
        3)
            echo "🔗 Implementing Google OAuth integration..."
            # Create OAuth flow based on requirements
            # Implement callback handling and user creation
            ;;
        *)
            echo "⚙️  Implementing general task..."
            # Generic task implementation
            ;;
    esac
    
    # Log implementation progress
    log_implementation_progress "$task_number" "$issue_name"
    
    echo "✅ Task $task_number implementation completed"
}
```

#### Task Modification Flow
```bash
function modify_task_approach() {
    local task_line=$1
    local issue_name=$2
    
    echo ""
    echo "✏️ TASK MODIFICATION"
    echo "==================="
    echo "What would you like to modify about this task?"
    echo ""
    echo "1. 🎯 Change implementation approach"
    echo "2. ⚡ Adjust task scope or requirements"
    echo "3. 🔗 Modify dependencies or prerequisites"  
    echo "4. ⏰ Change effort estimate or timeline"
    echo "5. 🧪 Adjust testing approach"
    echo "6. 📝 Add additional subtasks or considerations"
    echo ""
    
    read -p "Select modification type (1-6): " mod_type
    
    case $mod_type in
        1)
            echo "🎯 Modifying implementation approach..."
            echo "Describe your preferred approach:"
            read -p "New approach: " new_approach
            # Update task approach in documentation
            ;;
        2)
            echo "⚡ Adjusting task scope..."
            echo "Describe scope changes:"
            read -p "Scope modifications: " scope_changes
            # Update task scope
            ;;
        *)
            echo "✏️ Modification noted and will be applied"
            ;;
    esac
}
```

### 5. Quality Validation & Testing

#### Post-Implementation Validation
```bash
function validate_implementation() {
    local issue_name=$1
    
    echo ""
    echo "🧪 QUALITY VALIDATION"
    echo "===================="
    echo "Running post-implementation checks..."
    
    # Run tests if they exist
    if [ -f "package.json" ]; then
        echo "🧪 Running test suite..."
        npm test
    fi
    
    # Check code quality
    echo "📊 Checking code quality..."
    # Run linting, formatting checks
    
    # Validate against requirements
    echo "📋 Validating against requirements..."
    # Check if implementation meets acceptance criteria
    
    # Security validation
    echo "🔐 Running security checks..."
    # Check for security vulnerabilities
    
    echo "✅ Quality validation completed"
}
```

### 6. Progress Tracking & Documentation

## Output Files

### `tasks/<issue-name>/05-implementation-log.md`
Comprehensive implementation log:

```markdown
# Implementation Log: <Issue Name>

## Execution Summary
**Started**: 2024-01-15 09:00:00
**Completed**: 2024-01-18 16:30:00  
**Mode**: Interactive
**Total Tasks**: 10
**Completed**: 10
**Skipped**: 0
**Failed**: 0

## Task Execution Log

### Task 001: Database Schema Setup
**Status**: ✅ Completed  
**Started**: 2024-01-15 09:00:00
**Completed**: 2024-01-15 12:30:00
**Duration**: 3.5 hours

**Implementation Details**:
- Created PostgreSQL database schema
- Generated migration files for user authentication tables
- Added proper indexes and constraints
- Validated schema against design specifications

**Files Created**:
- `migrations/001_create_users_table.sql`
- `migrations/002_create_sessions_table.sql` 
- `migrations/003_create_audit_logs_table.sql`
- `schema/database_documentation.md`

**Validation Results**:
- ✅ Migration runs successfully on clean database
- ✅ All constraints properly enforced
- ✅ Performance benchmarks met (queries <50ms)
- ✅ Security review passed

**Notes**: Schema design required minor adjustment for Google ID field length

---

### Task 002: Authentication Service Foundation
**Status**: ✅ Completed
**Started**: 2024-01-15 14:00:00  
**Completed**: 2024-01-16 10:30:00
**Duration**: 4.5 hours

**Implementation Details**:
- Created Express.js authentication microservice
- Implemented JWT token generation with RS256 algorithm
- Set up middleware for protected route validation
- Added comprehensive error handling and logging

**Files Created**:
- `services/auth-service/app.js`
- `services/auth-service/middleware/auth.js`
- `services/auth-service/utils/jwt.js`
- `services/auth-service/routes/auth.js`

**Validation Results**:
- ✅ Service passes all health checks
- ✅ JWT tokens properly signed and validated
- ✅ Protected routes reject invalid tokens
- ✅ Rate limiting properly configured

**Notes**: Added additional security headers based on OWASP recommendations

[Continue for all tasks...]

## Implementation Metrics

### Code Quality
- **Lines of Code**: 2,847
- **Test Coverage**: 94.2%
- **Maintainability Index**: 78
- **Technical Debt**: 2.1 hours

### Performance Benchmarks  
- **Authentication API Response Time**: 145ms (95th percentile)
- **Database Query Performance**: 32ms average
- **Memory Usage**: 67MB peak
- **CPU Usage**: 12% peak during load testing

### Security Validation
- **Vulnerability Scan**: 0 critical, 1 medium (false positive)
- **Dependency Audit**: All dependencies up to date
- **Security Headers**: All OWASP recommended headers present
- **Authentication Flow**: Passed security review

## Issues & Resolutions

### Issue 001: Google OAuth Callback URL
**Problem**: OAuth callback URL not properly configured for development environment
**Resolution**: Updated Google Cloud Console settings and environment configuration
**Time Impact**: +30 minutes
**Files Modified**: `.env.development`, `config/oauth.js`

### Issue 002: Database Connection Pool
**Problem**: Connection pool exhaustion during load testing
**Resolution**: Increased pool size and implemented connection timeout
**Time Impact**: +45 minutes  
**Files Modified**: `config/database.js`

## Lessons Learned

1. **Environment Configuration**: OAuth callback URLs need careful environment-specific setup
2. **Database Performance**: Connection pooling configuration critical for performance
3. **Testing Strategy**: Integration tests caught issues unit tests missed
4. **Security Review**: Early security review prevented potential vulnerabilities
5. **Documentation**: Real-time documentation saved significant time in handoff

## Next Steps

1. **Deployment**: Ready for staging environment deployment
2. **Monitoring**: Implement production monitoring and alerting
3. **User Testing**: Conduct user acceptance testing with stakeholders
4. **Performance Optimization**: Fine-tune based on load testing results
5. **Documentation**: Complete operational runbooks for production support

## Artifacts Created

### Code Artifacts
- **Database Migrations**: 3 files, 127 lines
- **Backend Services**: 8 files, 1,247 lines  
- **Frontend Components**: 6 files, 892 lines
- **Test Suites**: 12 files, 581 lines

### Documentation Artifacts  
- **API Documentation**: OpenAPI 3.0 specification
- **Database Schema**: ERD and table specifications
- **Deployment Guide**: Step-by-step deployment instructions
- **Operational Runbooks**: Troubleshooting and maintenance guides

### Configuration Artifacts
- **Environment Files**: Development, staging, production configs
- **CI/CD Pipeline**: GitHub Actions workflow configuration
- **Docker Configuration**: Multi-stage build and compose files
- **Monitoring Configuration**: Prometheus and Grafana dashboards
```

### `tasks/<issue-name>/05-code-changes.md`
Summary of all code modifications and file changes.

### `tasks/<issue-name>/05-test-results.md`
Testing outcomes and quality validation results.

## Interactive Features

### Real-time Progress Display
```bash
# Progress indicator during execution
echo "🔄 Progress: ████████░░ 80% (Task 8/10)"
echo "⏱️  Elapsed: 2h 15m | Estimated remaining: 35m"
echo "📊 Current: Implementing frontend OAuth integration"
```

### User Decision Points
```bash
# Example decision point during implementation
echo "⚠️ DECISION REQUIRED"
echo "==================="
echo "Code generation suggests using Redux for state management."
echo "However, React Context might be simpler for this use case."
echo ""
echo "Current Context:"
echo "- 3 components need authentication state"
echo "- No complex state interactions identified"
echo "- Team prefers simpler solutions when possible"
echo ""  
echo "1. Use Redux (more scalable, complex setup)"
echo "2. Use React Context (simpler, sufficient for current needs)"
echo "3. Let me review the code and decide"
echo ""
read -p "Your choice (1-3): " state_choice
```

## Error Handling
```bash
# Comprehensive error handling
function handle_implementation_error() {
    local task_number=$1
    local error_msg=$2
    local issue_name=$3
    
    echo "❌ Error in Task $task_number: $error_msg"
    echo ""
    echo "Options:"
    echo "1. 🔄 Retry task with same approach"
    echo "2. ✏️  Modify approach and retry"
    echo "3. ⏭️  Skip task and continue"
    echo "4. 🛑 Stop implementation for investigation"
    
    read -p "Select option (1-4): " error_choice
    
    # Log error for investigation
    echo "Task $task_number Error: $error_msg" >> "tasks/$issue_name/05-errors.log"
    
    case $error_choice in
        1) retry_task "$task_number" "$issue_name" ;;
        2) modify_and_retry_task "$task_number" "$issue_name" ;;  
        3) skip_task_with_error "$task_number" "$issue_name" "$error_msg" ;;
        4) stop_implementation_for_investigation "$task_number" "$issue_name" "$error_msg" ;;
    esac
}
```

## Integration Points
- **Previous Phases**: Uses all documentation from concept through task breakdown
- **Code Generation**: Creates actual implementation files based on specifications  
- **Quality Assurance**: Integrates testing and validation throughout execution
- **Documentation**: Maintains comprehensive logs and progress tracking

## Tips for Success
1. **Start Interactive**: Use interactive mode first time through any workflow
2. **Review Before Proceeding**: Carefully review each task before approval
3. **Test Incrementally**: Validate each task before moving to next
4. **Document Decisions**: Record any modifications or deviations from plan
5. **Monitor Progress**: Use progress tracking to stay on timeline
6. **Quality Gates**: Don't skip validation steps for speed

## Example Workflow
```bash
# Start implementation phase  
./implement.md

# System validates comprehensive prerequisites
✅ Prerequisites validated. Loading comprehensive context...
📄 Found 12 documentation files
📋 Parsing task breakdown for execution...
📊 Found 10 tasks in breakdown document

# User selects interactive mode
📋 Interactive Mode selected - maximum control and quality

# Task-by-task execution with user approval
📋 TASK 1 of 10: Database Schema Setup
🏷️ Task Details: [detailed task information displayed]
Options: 1. Execute | 2. Modify | 3. Skip | 4. Review | 5. Stop
Select option: 1

✅ Executing task...
🗄️ Setting up database schema...
✅ Task 1 completed

# Continue through all tasks with quality validation
🎉 Implementation completed successfully!
📊 Final Results:
  - 10/10 tasks completed
  - 94.2% test coverage achieved  
  - All quality gates passed
  - Ready for deployment

📁 Implementation artifacts saved to:
  - tasks/google-oauth-integration/05-implementation-log.md
  - tasks/google-oauth-integration/05-code-changes.md
  - tasks/google-oauth-integration/05-test-results.md
```