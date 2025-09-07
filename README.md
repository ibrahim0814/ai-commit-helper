# AI Commit Helper 🤖

Ultra token-efficient AI-powered git commit message generator using Claude 3.5 Haiku. Analyzes your actual code changes to generate meaningful conventional commit messages.

## ✨ Features

- **🧠 AI-Powered**: Analyzes git diff content using Claude 3.5 Haiku
- **💰 Ultra Cheap**: ~$0.00025 per commit (typically <1¢ per day)
- **⚡ Token Efficient**: Aggressive optimization for minimal API costs
- **🔄 Smart Fallback**: Enhanced conventional commit logic when AI unavailable
- **🎯 Interactive**: Shows generated message with confirmation prompt
- **📊 Preview Mode**: See what would be committed without committing

## 💸 Cost Breakdown

- **Input**: ~500 chars avg diff = ~$0.0004 per commit
- **Output**: ~30 chars avg message = ~$0.0001 per commit  
- **Total**: **~$0.0005 per commit** (still very affordable!)

Uses Claude 3.5 Haiku - fast, efficient, and enhanced capabilities.

## 🚀 Installation

### 1. Copy Script
```bash
# Copy to your bin directory
cp ai-commit ~/bin/
chmod +x ~/bin/ai-commit
```

### 2. Add to Shell Config
Add these lines to your `~/.zshrc` (or `~/.bashrc`):

```bash
# AI-powered commit helper
export ANTHROPIC_API_KEY='your-api-key-here'
source "$HOME/bin/ai-commit"
```

### 3. Get API Key
1. Visit https://console.anthropic.com/
2. Create account and get API key
3. Replace `your-api-key-here` in step 2

### 4. Reload Shell
```bash
source ~/.zshrc
```

## 📖 Usage

```bash
# AI-powered commit with confirmation
qc

# Preview commit message without committing  
qc view

# Show setup instructions
qc setup

# Use custom message (skips AI)
qc "fix: resolve critical payment bug"
```

## 🎯 Generated Message Examples

The AI analyzes your actual code changes and generates conventional commit messages:

- `feat: add user authentication system`
- `fix: resolve memory leak in data processor`
- `refactor: simplify database connection logic` 
- `docs: update API documentation`
- `test: add unit tests for payment module`
- `style: fix eslint formatting issues`

## ⚙️ How It Works

1. **Stage Changes**: Automatically runs `git add .`
2. **Analyze Diff**: Sends git diff to Claude 3.5 Haiku (truncated to 2000 chars)
3. **Generate Message**: AI creates conventional commit message
4. **Confirmation**: Shows message and asks for approval
5. **Commit & Push**: Commits and pushes to main/master branch

## 🔧 Configuration

### Token Optimization
- Max 2000 chars diff input (prevents excessive costs)
- Max 50 tokens output (concise messages)
- Temperature 0.1 (consistent, focused responses)

### Fallback Logic
Without API key, generates enhanced conventional commits based on:
- File types (JS, Python, CSS, etc.)
- Change patterns (added, modified, deleted)
- Special files (README, tests, configs)

## 🛡️ Safety Features

- **Git Repository Check**: Only works in git repositories
- **Change Detection**: Won't commit if no changes staged
- **Branch Detection**: Automatically detects main/master branch
- **Error Handling**: Graceful fallback if AI fails
- **Input Validation**: Ensures generated messages are reasonable

## 🔒 Security

- API key stored in shell environment (not in code)
- No data persistence - only sends diff to Claude API
- Fails safely to basic commit generation if API unavailable

## 🤝 Contributing

This is a personal utility, but feel free to fork and customize for your needs!

## 📝 License

MIT - Use it however you want!

---

**Made with ❤️ for developers who want meaningful commit messages without the hassle.**
