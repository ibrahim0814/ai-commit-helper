#!/bin/bash

# AI Commit Helper Installation Script

set -e

echo "🤖 AI Commit Helper Installation"
echo "================================"
echo ""

# Create bin directory if it doesn't exist
mkdir -p ~/bin

# Copy the script
echo "📁 Copying ai-commit to ~/bin/"
cp ai-commit ~/bin/
chmod +x ~/bin/ai-commit

# Detect shell
SHELL_RC=""
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    echo "⚠️  Could not detect shell. Please manually add to your shell config:"
    echo "   source \"\$HOME/bin/ai-commit\""
    exit 0
fi

echo "🔧 Adding to $SHELL_RC"

# Check if already added
if grep -q "source.*ai-commit" "$SHELL_RC" 2>/dev/null; then
    echo "✅ Already configured in $SHELL_RC"
else
    echo "" >> "$SHELL_RC"
    echo "# AI-powered commit helper" >> "$SHELL_RC"
    echo "source \"\$HOME/bin/ai-commit\"" >> "$SHELL_RC"
    echo "✅ Added to $SHELL_RC"
fi

echo ""
echo "🎉 Installation complete!"
echo ""
echo "Next steps:"
echo "1. Get API key: https://console.anthropic.com/"
echo "2. Add to $SHELL_RC:"
echo "   export ANTHROPIC_API_KEY='your-api-key-here'"
echo "3. Reload shell: source $SHELL_RC"
echo ""
echo "Then try: qc setup"
