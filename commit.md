# Commit Slash Command

## Purpose
Add all untracked files and create a conventional commit with proper formatting.

## Usage
```
/commit [message]
```

## Process

### 1. Check Git Status
```bash
git status
git diff --cached
git log --oneline -5
```

### 2. Analyze Changes
- List the files that have been changed or added
- Summarize the nature of the changes (new feature, enhancement, bug fix, refactoring, test, docs, etc.)
- Brainstorm the purpose or motivation behind these changes
- Assess the impact of these changes on the overall project
- Check for any sensitive information that shouldn't be committed

### 3. Add Files
```bash
git add .
```
*Note: Add relevant untracked files to the staging area. Be careful not to stage files that aren't relevant to the commit.*

### 4. Create Conventional Commit
```bash
git commit -m "$(cat <<'EOF'
[type]: [description]

[optional body with more details]

🤖 Generated with [opencode](https://opencode.ai)

Co-Authored-By: opencode <noreply@opencode.ai>
EOF
)"
```

### 5. Verify Commit
```bash
git status
```

## Conventional Commit Types
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools

## Example
```bash
# For adding new documentation
git commit -m "docs: add API documentation for user authentication"

# For new features
git commit -m "feat: implement user login with OAuth2 integration"

# For bug fixes
git commit -m "fix: resolve memory leak in data processing module"
```

## Notes
- Always use the git context to determine which files are relevant to your commit
- NEVER update the git config
- DO NOT push to remote repository (use separate push command if needed)
- Ensure commit message is meaningful and concise
- Use HEREDOC format for proper commit message formatting