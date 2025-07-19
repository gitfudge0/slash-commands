# Doc Generator - Independent Documentation Generator

## Purpose
Standalone tool for analyzing any directory and creating comprehensive README.md documentation. Works independently of the main workflow system.

## Usage
```bash
/doc-generator
```

## Input Parameters
- **Directory path**: `<directory-path>` (will prompt if not provided)

## Prerequisites Check
- **REQUIRED**: Directory must exist and be accessible
- **No workflow dependencies**: Completely independent tool

## Validation Logic
```bash
# Prompt for directory path if not provided
if [ -z "$directory_path" ]; then
    echo "📁 DOC GENERATOR - README Creation Tool"
    echo "======================================"
    echo ""
    echo "Enter the directory path you want to document:"
    echo "Examples:"
    echo "  - . (current directory)"
    echo "  - ./src (source directory)"
    echo "  - /home/user/project (absolute path)"
    echo "  - ../my-project (relative path)"
    echo ""
    read -p "Directory path: " directory_path
fi

# Normalize and validate path
directory_path=$(realpath "$directory_path" 2>/dev/null)

# Check if directory exists
if [ ! -d "$directory_path" ]; then
    echo "❌ Error: Directory not found: $directory_path"
    echo "💡 Tip: Use 'ls' to check available directories"
    echo "💡 Tip: Use absolute paths to avoid confusion"
    exit 1
fi

# Check if directory is accessible
if [ ! -r "$directory_path" ]; then
    echo "❌ Error: Cannot read directory: $directory_path"
    echo "💡 Check permissions and try again"
    exit 1
fi

echo "✅ Directory validated: $directory_path"
echo "📊 Analyzing directory structure and contents..."
```

## Process

### 1. Directory Analysis & Content Discovery
```bash
# Analyze directory structure
echo "🔍 Scanning directory structure..."
total_files=$(find "$directory_path" -type f | wc -l)
total_dirs=$(find "$directory_path" -type d | wc -l)

echo "📊 Directory Statistics:"
echo "  - Total files: $total_files"
echo "  - Total directories: $total_dirs"

# Detect file types and patterns
echo "🔍 Analyzing file types and patterns..."

# Language detection
languages=()
if [ -f "$directory_path/package.json" ]; then languages+=("JavaScript/Node.js"); fi
if [ -f "$directory_path/requirements.txt" ] || [ -f "$directory_path/pyproject.toml" ]; then languages+=("Python"); fi
if [ -f "$directory_path/Cargo.toml" ]; then languages+=("Rust"); fi
if [ -f "$directory_path/go.mod" ]; then languages+=("Go"); fi
if [ -f "$directory_path/pom.xml" ] || [ -f "$directory_path/build.gradle" ]; then languages+=("Java"); fi
if [ -f "$directory_path/composer.json" ]; then languages+=("PHP"); fi
if [ -f "$directory_path/Gemfile" ]; then languages+=("Ruby"); fi

# Framework detection
frameworks=()
if [ -f "$directory_path/package.json" ]; then
    if grep -q "react" "$directory_path/package.json"; then frameworks+=("React"); fi
    if grep -q "vue" "$directory_path/package.json"; then frameworks+=("Vue.js"); fi
    if grep -q "angular" "$directory_path/package.json"; then frameworks+=("Angular"); fi
    if grep -q "express" "$directory_path/package.json"; then frameworks+=("Express.js"); fi
    if grep -q "next" "$directory_path/package.json"; then frameworks+=("Next.js"); fi
fi

# Infrastructure detection
infra=()
if [ -f "$directory_path/Dockerfile" ]; then infra+=("Docker"); fi
if [ -f "$directory_path/docker-compose.yml" ]; then infra+=("Docker Compose"); fi
if [ -f "$directory_path/.github/workflows/"*.yml ]; then infra+=("GitHub Actions"); fi
if [ -f "$directory_path/terraform/"*.tf ]; then infra+=("Terraform"); fi

echo "📋 Detected Technologies:"
printf "  - Languages: %s\\n" "${languages[*]}"
printf "  - Frameworks: %s\\n" "${frameworks[*]}"
printf "  - Infrastructure: %s\\n" "${infra[*]}"
```

### 2. Interactive Documentation Planning
```bash
echo ""
echo "📝 DOCUMENTATION PLANNING"
echo "========================"
echo "Let's create comprehensive documentation for your project."
echo ""

# Project type and purpose
echo "🎯 PROJECT IDENTIFICATION"
echo "What type of project is this?"
echo "1. Web Application (Frontend/Backend/Full-stack)"
echo "2. Library/Package/SDK"  
echo "3. CLI Tool/Utility"
echo "4. Data Science/ML Project"
echo "5. Infrastructure/DevOps"
echo "6. Documentation/Guides"
echo "7. Other/Custom"
echo ""
read -p "Select project type (1-7): " project_type

# Project purpose and description
echo ""
echo "📖 PROJECT PURPOSE"
echo "Briefly describe what this project does:"
read -p "Project description: " project_description

echo ""
echo "Who is the target audience for this project?"
echo "1. Developers (other programmers)"
echo "2. End Users (non-technical users)"
echo "3. System Administrators"
echo "4. Data Scientists/Analysts"
echo "5. Mixed audience"
read -p "Select audience (1-5): " target_audience

# Key features identification
echo ""
echo "🌟 KEY FEATURES"
echo "What are the main features or capabilities? (one per line, empty line to finish)"
features=()
while true; do
    read -p "Feature $(($\{#features[@]\}+1)): " feature
    if [ -z "$feature" ]; then break; fi
    features+=("$feature")
done

# Installation and setup requirements
echo ""
echo "⚙️ SETUP REQUIREMENTS"
echo "What are the prerequisites for using this project?"
echo "Examples: Node.js 16+, Python 3.8+, Docker, specific OS, etc."
read -p "Prerequisites: " prerequisites

echo ""
echo "How is this project typically installed?"
echo "1. npm/yarn install"
echo "2. pip install"
echo "3. git clone + manual setup"
echo "4. Docker container"
echo "5. Binary download"
echo "6. Other/Custom"
read -p "Installation method (1-6): " install_method

# Usage examples
echo ""
echo "🚀 USAGE EXAMPLES"
echo "What are common usage examples or commands?"
usage_examples=()
echo "Enter usage examples (one per line, empty line to finish):"
while true; do
    read -p "Example $(($\{#usage_examples[@]\}+1)): " example
    if [ -z "$example" ]; then break; fi
    usage_examples+=("$example")
done

# Development and contribution info
echo ""
echo "👥 DEVELOPMENT INFO"
echo "Should the README include development/contribution information?"
read -p "Include dev info? (y/n): " include_dev_info

if [ "$include_dev_info" = "y" ]; then
    echo "What's the preferred development setup?"
    read -p "Dev setup: " dev_setup
    
    echo "How should people contribute?"
    read -p "Contribution process: " contribution_process
fi
```

### 3. Content Generation & Structure Creation

#### Directory Structure Analysis
```bash
function generate_directory_tree() {
    local dir_path=$1
    local max_depth=${2:-3}
    
    echo "📁 Generating directory tree..."
    
    # Create ASCII directory tree
    tree_output=""
    if command -v tree >/dev/null 2>&1; then
        tree_output=$(tree -L $max_depth -a -I 'node_modules|.git|.env*|dist|build' "$dir_path")
    else
        # Fallback directory structure using find
        tree_output=$(find "$dir_path" -maxdepth $max_depth -not -path '*/node_modules/*' -not -path '*/.git/*' | sed 's|[^/]*/| |g')
    fi
    
    echo "$tree_output"
}
```

#### Technology-Specific Content
```bash
function generate_tech_specific_content() {
    local languages=("$@")
    
    # Generate installation instructions based on detected tech
    if [[ " ${languages[@]} " =~ " JavaScript/Node.js " ]]; then
        cat << EOF
## Installation

\`\`\`bash
# Clone the repository
git clone <repository-url>
cd <project-directory>

# Install dependencies
npm install
# or
yarn install
\`\`\`

## Scripts

\`\`\`bash
# Development
npm run dev

# Build
npm run build

# Test
npm test

# Lint
npm run lint
\`\`\`
EOF
    fi
    
    if [[ " ${languages[@]} " =~ " Python " ]]; then
        cat << EOF
## Installation

\`\`\`bash
# Clone the repository
git clone <repository-url>
cd <project-directory>

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\\Scripts\\activate

# Install dependencies
pip install -r requirements.txt
\`\`\`

## Usage

\`\`\`bash
# Run the application
python main.py

# Run tests
pytest

# Install in development mode
pip install -e .
\`\`\`
EOF
    fi
}
```

## Output File

### `<directory-path>/README.md`
Comprehensive project documentation:

```markdown
# Project Name

Brief project description based on analysis and user input.

## 🎯 Overview

[Detailed description based on user input and code analysis]

## 📁 Project Structure

\`\`\`
project-root/
├── src/                    # Source code
│   ├── components/         # React components
│   ├── services/          # API services
│   └── utils/             # Utility functions
├── tests/                 # Test files
├── docs/                  # Documentation
├── public/                # Static assets
├── package.json           # Node.js dependencies
├── .gitignore            # Git ignore rules
└── README.md             # This file
\`\`\`

## 🚀 Quick Start

### Prerequisites

- Node.js 16 or higher
- npm or yarn package manager
- [Any other requirements based on analysis]

### Installation

1. **Clone the repository**
   \`\`\`bash
   git clone <repository-url>
   cd <project-directory>
   \`\`\`

2. **Install dependencies**
   \`\`\`bash
   npm install
   # or
   yarn install
   \`\`\`

3. **Set up environment**
   \`\`\`bash
   cp .env.example .env
   # Edit .env with your configuration
   \`\`\`

4. **Start development server**
   \`\`\`bash
   npm run dev
   \`\`\`

## 📖 Usage

### Basic Usage
[Generated based on user input and code analysis]

\`\`\`bash
# Example usage command
npm start
\`\`\`

### Configuration
[If configuration files detected]

The application can be configured through:
- Environment variables (`.env` file)
- Configuration files (`config/`)
- Command line arguments

### API Documentation
[If API endpoints detected]

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/health` | GET | Health check |
| `/api/users` | GET | Get users |
| `/api/auth` | POST | Authentication |

## 🛠️ Development

### Development Setup

1. **Clone and install** (see Quick Start above)

2. **Run in development mode**
   \`\`\`bash
   npm run dev
   \`\`\`

3. **Run tests**
   \`\`\`bash
   npm test           # Unit tests
   npm run test:e2e   # End-to-end tests
   npm run test:watch # Watch mode
   \`\`\`

4. **Code quality**
   \`\`\`bash
   npm run lint       # ESLint
   npm run format     # Prettier
   npm run typecheck  # TypeScript
   \`\`\`

### Project Scripts

| Script | Description |
|--------|-------------|
| \`npm start\` | Start production server |
| \`npm run dev\` | Start development server |
| \`npm run build\` | Build for production |
| \`npm test\` | Run test suite |
| \`npm run lint\` | Run linter |

### Architecture

[Generated based on code analysis]

This project follows a [detected architecture pattern]:
- **Frontend**: [Detected frontend tech]
- **Backend**: [Detected backend tech]  
- **Database**: [Detected database]
- **Authentication**: [If auth detected]

## 📚 Features

[Generated from user input and code analysis]

- ✅ **Feature 1**: Description
- ✅ **Feature 2**: Description  
- ✅ **Feature 3**: Description
- 🚧 **Feature 4**: In development
- 📋 **Feature 5**: Planned

## 🔧 Configuration

### Environment Variables

\`\`\`bash
# Database
DATABASE_URL=postgresql://user:pass@localhost/dbname

# Authentication  
JWT_SECRET=your-secret-key
OAUTH_CLIENT_ID=your-oauth-client-id

# External APIs
API_BASE_URL=https://api.example.com
API_KEY=your-api-key
\`\`\`

### Configuration Files

- \`config/database.js\` - Database configuration
- \`config/auth.js\` - Authentication settings
- \`.env\` - Environment variables

## 🧪 Testing

### Running Tests

\`\`\`bash
# All tests
npm test

# Unit tests only
npm run test:unit

# Integration tests
npm run test:integration  

# Watch mode
npm run test:watch

# Coverage report
npm run test:coverage
\`\`\`

### Test Structure

\`\`\`
tests/
├── unit/              # Unit tests
├── integration/       # Integration tests
├── e2e/              # End-to-end tests
└── fixtures/         # Test data
\`\`\`

## 🚀 Deployment

### Production Build

\`\`\`bash
# Build for production
npm run build

# Start production server
npm start
\`\`\`

### Docker Deployment

[If Dockerfile detected]

\`\`\`bash
# Build image
docker build -t project-name .

# Run container
docker run -p 3000:3000 project-name
\`\`\`

### Environment Setup

1. Set up environment variables
2. Configure database connection
3. Set up SSL certificates (if needed)
4. Configure reverse proxy (Nginx/Apache)

## 🤝 Contributing

We welcome contributions! Please see our contributing guidelines:

### Development Process

1. **Fork** the repository
2. **Create** a feature branch (\`git checkout -b feature/amazing-feature\`)
3. **Commit** your changes (\`git commit -m 'Add amazing feature'\`)
4. **Push** to the branch (\`git push origin feature/amazing-feature\`)
5. **Open** a Pull Request

### Code Standards

- Follow existing code style
- Write tests for new features
- Update documentation as needed
- Run linter before committing

### Reporting Issues

Please use the [issue tracker](issues) to report bugs or request features.

## 📄 License

[License information - auto-detected if LICENSE file exists]

## 🆘 Support

- 📖 **Documentation**: [Link to docs]
- 💬 **Discussions**: [Link to discussions]
- 🐛 **Issues**: [Link to issues]
- 📧 **Email**: [Contact email if provided]

## 🏗️ Built With

[Generated based on detected technologies]

- **Frontend**: React, TypeScript, Tailwind CSS
- **Backend**: Node.js, Express, PostgreSQL
- **Testing**: Jest, Cypress, Testing Library
- **DevOps**: Docker, GitHub Actions, AWS

## 📈 Roadmap

- [ ] Feature 1 implementation
- [ ] Performance optimizations
- [ ] Mobile app development
- [ ] API v2 development

---

**Generated by [opencode doc-generator](https://opencode.ai)** on $(date)
```

## Interactive Features

### Technology Detection Feedback
```bash
echo "🤖 AUTOMATIC DETECTION RESULTS"
echo "=============================="
echo "Based on file analysis, I detected:"
echo "  - Languages: ${languages[*]}"
echo "  - Frameworks: ${frameworks[*]}"
echo "  - Infrastructure: ${infra[*]}"
echo ""
echo "Is this detection accurate?"
read -p "Correct? (y/n): " detection_correct

if [ "$detection_correct" != "y" ]; then
    echo "Please specify the correct technologies:"
    read -p "Languages: " manual_languages
    read -p "Frameworks: " manual_frameworks
    read -p "Infrastructure: " manual_infra
fi
```

### Content Customization
```bash
echo ""
echo "📝 CONTENT CUSTOMIZATION"
echo "======================="
echo "What sections should be included in the README?"
echo ""
echo "Standard sections (always included):"
echo "  ✅ Project Overview"
echo "  ✅ Installation Instructions"
echo "  ✅ Basic Usage Examples"
echo ""
echo "Optional sections:"
echo "  1. 🏗️  Architecture/Design"
echo "  2. 🧪 Testing Instructions"  
echo "  3. 🚀 Deployment Guide"
echo "  4. 🤝 Contributing Guidelines"
echo "  5. 📚 API Documentation"
echo "  6. 🔧 Configuration Details"
echo "  7. 🎯 Roadmap/Future Plans"
echo ""
echo "Select optional sections to include (space-separated numbers):"
read -p "Sections: " selected_sections
```

## Error Handling
```bash
# Handle various error conditions
function handle_generation_error() {
    local error_type=$1
    local error_msg=$2
    
    case $error_type in
        "permission_denied")
            echo "❌ Error: Permission denied accessing directory"
            echo "💡 Solution: Check directory permissions or run with appropriate privileges"
            ;;
        "empty_directory")  
            echo "⚠️ Warning: Directory appears to be empty"
            echo "💡 Creating basic README template"
            ;;
        "binary_files_only")
            echo "ℹ️ Info: Directory contains only binary files"
            echo "💡 Creating general-purpose README"
            ;;
        "analysis_failed")
            echo "❌ Error: Failed to analyze directory contents"
            echo "💡 Falling back to manual input mode"
            ;;
        *)
            echo "❌ Unexpected error: $error_msg"
            echo "💡 Please report this issue"
            ;;
    esac
}

# Check for existing README
if [ -f "$directory_path/README.md" ]; then
    echo "⚠️ Warning: README.md already exists"
    echo "Current file: $(ls -lh "$directory_path/README.md")"
    echo ""
    echo "Options:"
    echo "1. 🔄 Overwrite existing README"
    echo "2. 📄 Create README.new.md"
    echo "3. 🚫 Cancel operation"
    
    read -p "Select option (1-3): " readme_choice
    
    case $readme_choice in
        1)
            echo "⚠️ Backing up existing README to README.backup.md"
            cp "$directory_path/README.md" "$directory_path/README.backup.md"
            ;;
        2)
            readme_filename="README.new.md"
            ;;
        3)
            echo "Operation cancelled"
            exit 0
            ;;
    esac
fi
```

## Advanced Features

### Multi-Language Project Support
- Detects and documents multiple programming languages in same project
- Generates appropriate installation and setup instructions for each
- Creates unified documentation that covers all project aspects

### Smart Content Generation
- Analyzes existing code comments and docstrings
- Extracts API endpoints and generates documentation tables
- Identifies configuration files and documents settings
- Detects test frameworks and generates testing instructions

### Customizable Templates
- Supports different README styles (minimal, comprehensive, corporate)
- Allows custom section ordering and content
- Provides industry-specific templates (web app, library, CLI tool, etc.)

## Integration with Main Workflow
While independent, this tool can enhance the main workflow:
```bash
# Can be called from other phases to generate project context
./doc-generator.md --directory=. --output=tasks/issue-name/00-project-context.md
```

## Tips for Success
1. **Accurate Description**: Provide detailed, accurate project descriptions
2. **Complete Feature List**: Include all major features and capabilities  
3. **Clear Examples**: Provide realistic usage examples
4. **Update Regularly**: Regenerate documentation as project evolves
5. **Review Output**: Always review and customize generated content

## Example Workflow
```bash
# Start documentation generation
./doc-generator.md

# System prompts for directory
📁 DOC GENERATOR - README Creation Tool
Enter the directory path: ./my-awesome-project

# System analyzes directory
✅ Directory validated: /home/user/my-awesome-project
🔍 Scanning directory structure...
📊 Directory Statistics: 47 files, 12 directories

# Interactive planning session
🤖 AUTOMATIC DETECTION RESULTS
Detected: JavaScript/Node.js, React, Docker
📝 Starting documentation planning session...

# After comprehensive Q&A session
✅ README.md generated successfully!
📄 Generated comprehensive documentation (247 lines)
📊 Included sections: Overview, Installation, Usage, Development, API, Contributing

💡 Tip: Review and customize the generated content
📁 Location: ./my-awesome-project/README.md
```