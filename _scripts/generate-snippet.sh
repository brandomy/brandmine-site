#!/bin/bash

# === Step 1: Validate Input ===
if [ -z "$1" ]; then
  echo "❌ Usage: $0 \"Your prompt here\""
  exit 1
fi

PROMPT="$1"
MODEL="gpt-4"  # You can change to gpt-3.5-turbo if needed

# === Step 2: Create output directory ===
OUTPUT_DIR="_includes/components/snippets"
mkdir -p "$OUTPUT_DIR"

# === Step 3: Format filename from prompt ===
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
FILENAME="$(echo "$PROMPT" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | cut -c1-50)-$TIMESTAMP.html"

# === Step 4: Request Codex/GPT response ===
RAW_OUTPUT=$(openai api chat.completions.create \
  -m "$MODEL" \
  -g user "$PROMPT" \
  --temperature 0.3 \
  --max-tokens 800)

# === Step 5: Extract code blocks (triple backticks preferred) ===
SNIPPET=$(echo "$RAW_OUTPUT" | sed -n '/```/,$p' | sed '/```/d')

# Fallback: use entire output if no code block is found
if [ -z "$SNIPPET" ]; then
  SNIPPET=$(echo "$RAW_OUTPUT")
fi

# === Step 6: Save output ===
echo "$SNIPPET" > "$OUTPUT_DIR/$FILENAME"

echo "✅ Snippet saved to: $OUTPUT_DIR/$FILENAME"
