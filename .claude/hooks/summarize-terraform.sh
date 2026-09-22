#!/bin/bash
# .claude/hooks/summarize-terraform.sh
# Reduces Terraform/Terramate output verbosity using Claude (or any LLM)

set -euo pipefail

if [ $# -gt 0 ]; then
    COMMAND_OUTPUT="$1"
else
    COMMAND_OUTPUT="$(cat)"
fi

# Detect if it's a plan or apply
if echo "$COMMAND_OUTPUT" | grep -qE "(Plan:|No changes|Changes to|Resources:.*added|changed|destroyed)"; then
    echo "=== Terraform Plan Summary (Reduced) ==="

    # Basic summary extraction
    echo "$COMMAND_OUTPUT" | grep -E "(Plan:|No changes\.|Resources:|added|changed|destroyed|will be|must be)" | head -20 || true

    echo ""
    echo "Key changes:"
    echo "$COMMAND_OUTPUT" | grep -E "^[ +~-]" | head -30 || true

    echo ""
    echo "Full output available in logs or run with --no-summary"
else
    # For other commands, pass through with minimal filtering
    echo "$COMMAND_OUTPUT" | head -100
fi

echo ""
echo "✅ Summarized by Terramate + Claude hook"
