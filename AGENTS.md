# AGENTS.md

## Project Overview
AI Commit Helper is a bash script that generates intelligent git commit messages using Claude 3 Haiku. It analyzes git diffs to create conventional commit messages with minimal API costs (~$0.00015 per commit).

## Setup Commands
```bash
# Install the tool
./install.sh

# Test installation
qc setup

# Verify API key is set
echo "API key configured: ${ANTHROPIC_API_KEY:0:20}..."
```

## Code Style
- **Bash/Shell scripting**: Follow POSIX-compliant patterns where possible
- **Functions**: Use `local` variables, proper error handling with `set -e`
- **Error messages**: Use emoji prefixes for visual clarity (❌, ⚠️, ✅)
- **Comments**: Document complex logic, especially API interactions
- **Quoting**: Always quote variables to prevent word splitting

## Testing Instructions
```bash
# Test in a git repository with changes
cd /path/to/git/repo
echo "test" > test.txt
git add .

# Test preview mode (doesn't commit)
qc view

# Test basic commit generation (without API)
unset ANTHROPIC_API_KEY
qc view

# Test with API key
export ANTHROPIC_API_KEY='your-key'
qc view
```

## API Integration Guidelines
- **Token Optimization**: Keep diff content under 2000 chars to minimize costs
- **Error Handling**: Always provide fallback to basic commit generation
- **Rate Limiting**: No special handling needed - Claude 3 Haiku has generous limits
- **Response Validation**: Ensure commit messages are 5-80 characters and valid

## Security Considerations
- **API Key**: Must be stored in environment variable, never hardcoded
- **Input Sanitization**: Git diff content is passed to API - ensure no sensitive data leaks
- **Command Injection**: Use proper quoting when executing git commands
- **Fallback Safety**: Script should work even if API calls fail

## File Structure
```
ai-commit-helper/
├── ai-commit          # Main executable script
├── install.sh         # Installation script
├── README.md          # Human documentation
└── AGENTS.md          # This file
```

## Common Tasks
### Adding New Features
1. Modify `ai-commit` script in the repository
2. Test locally: `cp ai-commit ~/bin/ai-commit && source ~/.zshrc`
3. Test all modes: `qc`, `qc view`, `qc setup`
4. Update README.md if user-facing changes
5. Use conventional commit format for changes

### Debugging API Issues
1. Check API key: `echo ${ANTHROPIC_API_KEY:0:20}`
2. Test with curl manually:
```bash
curl -s -X POST "https://api.anthropic.com/v1/messages" \
  -H "x-api-key: $ANTHROPIC_API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -d '{"model":"claude-3-haiku-20240307","max_tokens":50,"messages":[{"role":"user","content":"test"}]}'
```
3. Check fallback logic works: `unset ANTHROPIC_API_KEY && qc view`

### Deployment
- No traditional deployment - users install via `./install.sh`
- Updates: Users re-run install script or manually copy new `ai-commit` to `~/bin/`
- Repository serves as distribution mechanism

## Dependencies
- **bash**: Version 4+ (for array handling)
- **git**: Any modern version for diff/commit operations  
- **curl**: For API requests to Claude
- **jq**: For JSON parsing of API responses
- **Standard Unix tools**: wc, grep, sed, tr

## Environment Variables
- `ANTHROPIC_API_KEY`: Required for AI functionality, falls back gracefully if missing
- Standard git env vars are respected (GIT_AUTHOR_NAME, etc.)

## Performance Notes
- Script is optimized for minimal API costs
- Diff truncation at 2000 chars prevents excessive token usage
- Local fallback logic is fast and doesn't require network
- Average execution time: <2 seconds with API, <0.5s without
