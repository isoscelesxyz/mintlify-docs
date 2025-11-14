#!/bin/bash
# Mintlify documentation validation hook
# Runs after Write or Edit operations on .mdx files

set -e

FILE="$1"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "⚠️  File not found: $FILE"
  exit 0
fi

# Extract frontmatter (first 10 lines to be safe)
FRONTMATTER=$(head -10 "$FILE")

# Check for required frontmatter fields
ERRORS=0

if ! echo "$FRONTMATTER" | grep -q "^title:"; then
  echo "❌ Missing required frontmatter field: title"
  ERRORS=$((ERRORS + 1))
fi

if ! echo "$FRONTMATTER" | grep -q "^description:"; then
  echo "❌ Missing required frontmatter field: description"
  ERRORS=$((ERRORS + 1))
fi

# Check frontmatter is properly closed
if ! echo "$FRONTMATTER" | grep -q "^---" | head -2 | tail -1; then
  echo "❌ Frontmatter not properly closed with ---"
  ERRORS=$((ERRORS + 1))
fi

# Check description length (should be under 160 chars)
DESC_LINE=$(grep "^description:" "$FILE" | head -1)
if [ -n "$DESC_LINE" ]; then
  DESC_VALUE=$(echo "$DESC_LINE" | sed 's/^description: *"//' | sed 's/"$//')
  DESC_LENGTH=${#DESC_VALUE}
  if [ "$DESC_LENGTH" -gt 160 ]; then
    echo "⚠️  Description is ${DESC_LENGTH} characters (recommended max: 160)"
  fi
fi

# Success or failure
if [ $ERRORS -eq 0 ]; then
  echo "✅ Frontmatter validation passed"
  exit 0
else
  echo ""
  echo "Fix the above errors and try again."
  exit 1
fi
