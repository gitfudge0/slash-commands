#!/bin/bash

set -e

WORKFLOW_DIR="$HOME/.ai-workflows"
REPO_BASE="https://raw.githubusercontent.com/gitfudge/slash-commands/main"

echo "🔧 Setting up AI Workflows..."

mkdir -p "$WORKFLOW_DIR"

WORKFLOW_FILES=(
    "start-workflow.md"
    "express-spec.md"
    "balanced-spec.md"
    "comprehensive-spec.md"
    "quick-start.md"
    "workflow-utils.md"
    "README.md"
    "AGENTS.md"
)

echo "📥 Downloading workflow files to $WORKFLOW_DIR..."

for file in "${WORKFLOW_FILES[@]}"; do
    echo "  • $file"
    curl -fsSL "$REPO_BASE/$file" -o "$WORKFLOW_DIR/$file"
done

chmod +x "$WORKFLOW_DIR/start-workflow.md"

echo ""
echo "✅ AI Workflows installed successfully!"
echo ""
echo "Usage:"
echo "  $WORKFLOW_DIR/start-workflow.md \"your request\""
echo "  $WORKFLOW_DIR/start-workflow.md  # interactive mode"
echo ""
echo "Available workflows:"
echo "  • Express (2-3 min): Simple changes"
echo "  • Balanced (5-8 min): Medium complexity"
echo "  • Comprehensive (15-25 min): Novel features"
echo ""