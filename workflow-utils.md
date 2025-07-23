# Development Workflow Utilities

## Overview
Shared utilities, patterns, and components used across all workflow modes (Express, Balanced, Comprehensive). Provides consistent quality standards and reusable components.

## Pattern Recognition Library

### Code Style Detection
```javascript
// Example pattern detection logic
function detectCodeStyle(files) {
  return {
    indentation: detectIndentation(files),
    namingConvention: detectNaming(files),
    errorHandling: detectErrorPatterns(files),
    testingPatterns: detectTestPatterns(files),
    authPatterns: detectAuthPatterns(files)
  };
}
```

### Common Patterns Catalog

#### Authentication Patterns
```ruby
# Pattern: Rails Controller Authentication
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :authorize_action
  
  private
  
  def authorize_action
    authorize current_user, policy_class: PolicyClass
  end
end
```

#### Error Handling Patterns
```ruby
# Pattern: Standardized API Error Responses
def handle_error(error)
  case error
  when ActiveRecord::RecordNotFound
    render json: { success: false, message: I18n.t('errors.not_found') }, status: :not_found
  when ActiveRecord::RecordInvalid
    render json: { success: false, errors: error.record.errors }, status: :unprocessable_entity
  else
    render json: { success: false, message: I18n.t('errors.internal') }, status: :internal_server_error
  end
end
```

#### Validation Patterns
```ruby
# Pattern: Model Validation with Custom Messages
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, presence: true
  
  before_save :normalize_email
  
  private
  
  def normalize_email
    self.email = email.downcase.strip
  end
end
```

## EARS Requirements Templates

### Standard EARS Patterns
```markdown
## Functional Requirements Template

### Requirement: {Feature Name}
**User Story**: As a {role}, I want {capability}, so that {benefit}

**EARS Acceptance Criteria**:
1. WHEN {trigger event} THEN system SHALL {response} [AND {additional response}]
2. IF {precondition} THEN system SHALL {expected behavior} [AND SHALL NOT {forbidden behavior}]
3. WHEN {edge case} THEN system SHALL {fallback behavior} [WITHIN {time constraint}]
4. IF {error condition} THEN system SHALL {error handling} AND {user notification} AND {logging action}
5. WHEN {performance scenario} THEN system SHALL {performance requirement} WITHIN {time limit}
```

### Pattern-Informed EARS
```markdown
## Pattern-Informed EARS Template

### Requirement: {Feature Name}
**Pattern Reference**: Following {existing_pattern} from {location} in codebase

**EARS Acceptance Criteria**:
1. WHEN {trigger} THEN system SHALL {response} following {existing_pattern_name} pattern from {reference_file}
2. IF {condition} THEN system SHALL {behavior} consistent with {similar_feature} implementation  
3. WHEN {edge_case} THEN system SHALL {fallback} using {established_error_pattern} from {reference_location}
```

## Quality Gate Templates

### Code Quality Checklist
```markdown
## Code Quality Gates

### Style & Conventions
- [ ] Follows project naming conventions ({specific_convention})
- [ ] Indentation matches existing code ({spaces/tabs})
- [ ] Method length under {line_limit} lines
- [ ] Class responsibility is single and clear
- [ ] Comments explain why, not what

### Functionality  
- [ ] All acceptance criteria met
- [ ] Edge cases handled appropriately
- [ ] Error conditions handled gracefully
- [ ] Input validation implemented
- [ ] Output sanitization applied

### Security
- [ ] No hardcoded credentials or secrets
- [ ] SQL injection prevention implemented
- [ ] XSS prevention measures applied
- [ ] Authentication/authorization properly implemented
- [ ] Sensitive data properly handled

### Performance
- [ ] No N+1 query problems
- [ ] Database queries optimized
- [ ] Caching implemented where appropriate
- [ ] Resource usage reasonable
- [ ] Performance requirements met

### Testing
- [ ] Unit tests written with {coverage_percentage}% coverage
- [ ] Integration tests cover API contracts
- [ ] Edge cases tested
- [ ] Error conditions tested
- [ ] Performance tested under expected load

### Integration
- [ ] Backward compatibility maintained
- [ ] External API contracts honored
- [ ] Database migrations safe and reversible
- [ ] Configuration changes documented
- [ ] Deployment instructions provided
```

## File Organization Standards

### Directory Structure Template
```
tasks/{issue-name}/           # All files for single issue
├── express-spec.md           # Express mode: single file with implementation
├── balanced-requirements.md  # Balanced mode: focused requirements
├── balanced-implementation.md # Balanced mode: implementation plan
├── comprehensive-requirements.md # Comprehensive mode: full requirements
├── comprehensive-design.md   # Comprehensive mode: technical design
├── comprehensive-tasks.md    # Comprehensive mode: task breakdown
├── comprehensive-log.md      # Comprehensive mode: execution log
└── artifacts/               # Supporting files
    ├── diagrams/           # Mermaid diagrams, wireframes
    ├── research/           # Research findings, links
    └── code-samples/       # Code examples, prototypes
```

### File Naming Conventions
- Use kebab-case for all directories and files
- Prefix workflow files with mode name (express-, balanced-, comprehensive-)
- Use descriptive names that indicate content and purpose
- Date stamp implementation logs: comprehensive-log-2024-01-15.md

## Complexity Scoring Algorithm

### Detailed Scoring Matrix
```python
def calculate_complexity_score(analysis_results):
    score = 0
    
    # Pattern Recognition Scoring
    if analysis_results.existing_similar_features >= 2:
        score -= 2  # Strong existing patterns
    elif analysis_results.existing_similar_features == 1:
        score -= 1  # Some existing patterns
    
    if analysis_results.existing_models_extensible:
        score -= 1  # Can extend existing data models
    
    if analysis_results.new_domain_detected:
        score += 3  # Completely new domain
    
    if analysis_results.architectural_changes_needed:
        score += 2  # Requires architectural changes
    
    # Input Analysis Scoring  
    if analysis_results.has_detailed_requirements:
        score -= 1  # Clear requirements provided
    
    if analysis_results.input_is_vague:
        score += 2  # Vague input needs clarification
    
    if analysis_results.mentions_new_technology:
        score += 1  # New technology stack
    
    # Integration Complexity Scoring
    if analysis_results.single_component_change:
        score -= 1  # Isolated change
    
    if analysis_results.multiple_system_integration:
        score += 2  # Complex integration
    
    if analysis_results.external_service_integration:
        score += 1  # External dependencies
    
    # Context Quality Scoring
    if analysis_results.has_jira_or_github_context:
        score -= 1  # Rich external context
    
    if analysis_results.has_acceptance_criteria:
        score -= 1  # Pre-defined acceptance criteria
    
    return score

def route_workflow(score):
    if score <= 0:
        return "express"
    elif score <= 2:
        return "balanced" 
    else:
        return "comprehensive"
```

### Scoring Examples
```python
# Example 1: Add tibial support to reports API
analysis = {
    'existing_similar_features': 2,        # -2 (reports controller, similar patterns)
    'existing_models_extensible': True,    # -1 (TibialReport model exists)
    'new_domain_detected': False,          #  0 (reports domain exists)
    'architectural_changes_needed': False, #  0 (no architecture changes)
    'has_detailed_requirements': False,    #  0 (brief description)
    'input_is_vague': False,              #  0 (clear API requirement)
    'single_component_change': True,       # -1 (isolated to reports)
}
# Total Score: -4 → Express Mode

# Example 2: Add password reset functionality
analysis = {
    'existing_similar_features': 1,        # -1 (some email patterns)
    'existing_models_extensible': True,    # -1 (User model exists)
    'new_domain_detected': False,          #  0 (auth domain exists)
    'mentions_new_technology': False,      #  0 (uses existing stack)
    'input_is_vague': True,               # +2 (needs clarification)
    'multiple_system_integration': False,  #  0 (single system)
}
# Total Score: 0 → Express Mode (borderline)

# Example 3: Add real-time chat system
analysis = {
    'existing_similar_features': 0,        #  0 (no chat patterns)
    'new_domain_detected': True,          # +3 (messaging is new domain)
    'architectural_changes_needed': True,  # +2 (WebSocket infrastructure)
    'mentions_new_technology': True,      # +1 (WebSocket/ActionCable)
    'multiple_system_integration': True,   # +2 (real-time + persistence)
    'external_service_integration': False, #  0 (internal only)
}
# Total Score: +8 → Comprehensive Mode
```

## Approval Gate Templates

### Express Mode Approval
```markdown
## Express Implementation Review

**Feature**: {feature_name}
**Complexity Score**: {score} (Express Mode)

### Changes Summary
- **Files Modified**: {file_count} files
- **Pattern Consistency**: Following {pattern_names}
- **Integration Points**: {integration_summary}

### Implementation Preview
{code_preview_with_key_changes}

### Quality Validation
✓ Follows existing patterns from {reference_locations}
✓ Maintains backward compatibility  
✓ Includes appropriate error handling
✓ Covers identified edge cases

**Approve implementation and proceed with code generation?** (Y/N): ___
```

### Balanced Mode Approvals
```markdown
## Balanced Requirements Review

**Feature**: {feature_name}
**Requirements Count**: {count} core requirements

### Key Requirements
1. {requirement_1_summary}
2. {requirement_2_summary}  
3. {requirement_3_summary}

### Pattern Integration
- Leveraging: {existing_patterns}
- Creating: {new_patterns_needed}

**Approve requirements and proceed to implementation planning?** (Y/N): ___

---

## Balanced Implementation Plan Review

**Feature**: {feature_name}
**Task Count**: {task_count} implementation tasks

### Implementation Strategy
{strategy_summary}

### Key Components
- {component_1}: {description}
- {component_2}: {description}

### Risk Assessment
- High Risk: {high_risk_areas}
- Mitigation: {mitigation_strategies}

**Approve implementation plan and proceed with code generation?** (Y/N): ___
```

### Comprehensive Mode Approvals
```markdown
## Comprehensive Requirements Review

**Feature**: {feature_name}
**Requirements**: {functional_count} functional, {non_functional_count} non-functional

### Comprehensive Coverage
✓ Functional requirements with EARS criteria
✓ Non-functional requirements (performance, security, usability)
✓ Integration requirements with external systems
✓ Data requirements and models
✓ Success criteria and metrics

**Approve requirements and proceed to design phase?** (Y/N): ___

---

## Comprehensive Design Review  

**Feature**: {feature_name}
**Architecture**: {architecture_approach}

### Design Components
✓ System architecture with component diagrams
✓ Database design with entity relationships
✓ API design with endpoint specifications
✓ Security design with controls and measures
✓ Performance design with optimization strategy

**Approve design and proceed to task breakdown?** (Y/N): ___

---

## Comprehensive Task Review

**Feature**: {feature_name}
**Tasks**: {task_count} implementation tasks across {phase_count} phases

### Implementation Phases
1. **Foundation**: {foundation_task_count} tasks
2. **Core Features**: {core_task_count} tasks  
3. **Integration**: {integration_task_count} tasks
4. **Validation**: {validation_task_count} tasks

### Risk Management
- **High-Risk Tasks**: {high_risk_count} tasks with mitigation plans
- **Dependencies**: {dependency_count} task dependencies mapped
- **Quality Gates**: {quality_gate_count} quality checkpoints

**Approve tasks and begin implementation?** (Y/N): ___
```

## Context Caching Strategies

### File Context Cache
```javascript
// Context caching for token efficiency
class ContextCache {
  constructor() {
    this.fileContents = new Map();
    this.patternAnalysis = new Map();
    this.codebaseStructure = null;
  }
  
  cacheFileContent(filePath, content, analysis) {
    this.fileContents.set(filePath, {
      content,
      analysis,
      timestamp: Date.now()
    });
  }
  
  getCachedContent(filePath) {
    return this.fileContents.get(filePath);
  }
  
  cachePatternAnalysis(pattern, analysis) {
    this.patternAnalysis.set(pattern, analysis);
  }
  
  getPatternAnalysis(pattern) {
    return this.patternAnalysis.get(pattern);
  }
}
```

### Pattern Reuse Strategy
```markdown
## Pattern Reuse Guidelines

### When to Reuse Cached Patterns
- Same workflow session (Express → Balanced escalation)
- Similar feature requests within same domain
- File discovery results for related components

### When to Refresh Cache
- File modifications detected
- New workflow session started
- User explicitly requests fresh analysis
- Cache age exceeds threshold (30 minutes)

### Cache Optimization
- Store only essential context, not full file contents
- Compress repetitive patterns into reusable templates
- Cache file relationships and dependency maps
- Maintain pattern similarity scores for reuse decisions
```

## Integration Helpers

### External Context Processors
```python
def process_github_issue(url):
    """Extract requirements from GitHub issue"""
    return {
        'title': extract_title(url),
        'description': extract_description(url),
        'acceptance_criteria': extract_acceptance_criteria(url),
        'labels': extract_labels(url),
        'complexity_indicators': analyze_complexity_indicators(url)
    }

def process_jira_ticket(url):
    """Extract requirements from JIRA ticket"""  
    return {
        'summary': extract_summary(url),
        'description': extract_description(url),
        'acceptance_criteria': extract_acceptance_criteria(url),
        'story_points': extract_story_points(url),
        'complexity_indicators': analyze_complexity_indicators(url)
    }
```

### Code Generation Helpers
```python
def generate_code_following_pattern(pattern, requirements):
    """Generate code that follows existing patterns"""
    return {
        'code': apply_pattern_to_requirements(pattern, requirements),
        'style': match_existing_style(pattern),
        'conventions': follow_naming_conventions(pattern),
        'error_handling': apply_error_handling_pattern(pattern)
    }

def validate_generated_code(code, patterns, requirements):
    """Validate generated code against patterns and requirements"""
    return {
        'pattern_compliance': check_pattern_compliance(code, patterns),
        'requirement_coverage': check_requirement_coverage(code, requirements),
        'quality_score': calculate_quality_score(code),
        'suggestions': generate_improvement_suggestions(code)
    }
```

---

*These utilities ensure consistency, quality, and efficiency across all workflow modes while maintaining the flexibility to handle different complexity levels appropriately.*