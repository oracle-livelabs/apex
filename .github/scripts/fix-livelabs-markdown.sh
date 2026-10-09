#!/bin/bash
# LiveLabs Markdown Auto-Fixer
# Automatically fixes issues that can be safely resolved without human judgment.
# Run this before submitting a PR to fix common validation errors.
#
# Usage:
#   ./fix-livelabs-markdown.sh /path/to/workshop   # Fix all .md files in directory
#   ./fix-livelabs-markdown.sh file1.md file2.md   # Fix specific files
#   ./fix-livelabs-markdown.sh                     # Fix all .md files in current directory

set +e

FIXED=0
SKIPPED=0

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

log_fixed() {
    echo -e "  ${GREEN}FIXED${NC}: $1"
    ((FIXED++))
}

log_skipped() {
    echo -e "  ${YELLOW}MANUAL${NC}: $1"
    ((SKIPPED++))
}

log_section() {
    echo -e "${CYAN}$1${NC}"
}

# Get markdown files from args, directory, or find all in current directory
if [ $# -gt 0 ]; then
    if [ -d "$1" ]; then
        TARGET_DIR="$1"
        echo "Scanning directory: $TARGET_DIR"
        echo ""
        FILES=$(find "$TARGET_DIR" -name "*.md" -type f | grep -v node_modules | grep -v .github | sort)
    else
        FILES="$@"
    fi
else
    FILES=$(find . -name "*.md" -type f | grep -v node_modules | grep -v .github | sort)
fi

if [ -z "$FILES" ]; then
    echo "No markdown files found."
    exit 0
fi

echo "================================================"
echo "LiveLabs Markdown Auto-Fixer"
echo "================================================"
echo ""

for file in $FILES; do
    [ ! -f "$file" ] && continue

    echo "Processing: $file"
    FILE_FIXES=0

    # ----------------------------------------------------------------
    # Fix 9b: Replace tab characters after numbered list items with a space
    # "1.\t" → "1. "
    # ----------------------------------------------------------------
    if grep -qE $'^[[:space:]]*[0-9]+\\.\t' "$file"; then
        perl -i -pe 's/^(\s*[0-9]+\.)\t/$1 /g' "$file"
        log_fixed "Replaced tab characters with spaces in numbered list items"
        ((FILE_FIXES++))
    fi

    # ----------------------------------------------------------------
    # Fix 9c: Replace multiple spaces after numbered list items with a single space
    # "1.  text" → "1. text"
    # ----------------------------------------------------------------
    if grep -qE '^[[:space:]]*[0-9]+\.  ' "$file"; then
        perl -i -pe 's/^(\s*[0-9]+\.) {2,}/$1 /g' "$file"
        log_fixed "Replaced multiple spaces with single space in numbered list items"
        ((FILE_FIXES++))
    fi

    # ----------------------------------------------------------------
    # Fix 5b: Convert HTML anchor tags to Markdown links
    # <a href="URL">text</a>  →  [text](URL)
    # ----------------------------------------------------------------
    if grep -qi '<a[[:space:]]*href=' "$file"; then
        # Use perl for reliable multiline-safe substitution
        perl -i -pe 's|<a\s+href=["\x27]([^"'\'']+)["\x27]\s*>([^<]*)</a>|[$2]($1)|gi' "$file"
        log_fixed "Converted HTML anchor tags to Markdown links"
        ((FILE_FIXES++))
    fi

    # ----------------------------------------------------------------
    # Fix 5: Add placeholder alt text to empty image references
    # ![]( → ![image](
    # Excludes YouTube embeds: ![](youtube:...)
    # ----------------------------------------------------------------
    if grep -q '!\[\](' "$file" | grep -v 'youtube:' 2>/dev/null || \
       grep -qP '!\[\]\((?!youtube:)' "$file" 2>/dev/null; then
        perl -i -pe 's/!\[\]\((?!youtube:)/![image](/g' "$file"
        log_fixed "Added placeholder alt text 'image' to empty image references (review and replace with descriptive text)"
        ((FILE_FIXES++))
    fi

    # ----------------------------------------------------------------
    # Fix 14: Lowercase image file paths in markdown references
    # ![alt](images/MyFile.PNG)  →  ![alt](images/myfile.png)
    # ----------------------------------------------------------------
    if grep -oE 'images/[^)"]+' "$file" | grep -q '[A-Z]'; then
        perl -i -pe 's|(!\[[^\]]*\]\()([^)]+)(\))|
            my ($pre,$path,$post) = ($1,$2,$3);
            $path =~ s{(images/[^"\s)]+)}{lc($1)}ge;
            "$pre$path$post"
        |ge' "$file"
        log_fixed "Lowercased image file paths in references"
        ((FILE_FIXES++))
    fi

    # ----------------------------------------------------------------
    # Fix 3: Add Acknowledgements section if missing
    # ----------------------------------------------------------------
    if ! grep -q "^## Acknowledgements" "$file"; then
        echo "" >> "$file"
        echo "## Acknowledgements" >> "$file"
        echo "" >> "$file"
        echo "* **Author** - TODO: Your Name, Your Title, Your Organization" >> "$file"
        echo "* **Last Updated By/Date** - TODO: Your Name, Month Year" >> "$file"
        log_fixed "Added '## Acknowledgements' section at end of file (update with your details)"
        ((FILE_FIXES++))
    fi

    # ----------------------------------------------------------------
    # Fix 12/13: Add Estimated Time if missing
    # For introduction.md: add "Estimated Workshop Time: x minutes"
    # For others: add "Estimated Time: x minutes" after Introduction header
    # ----------------------------------------------------------------
    basename_file=$(basename "$file")
    if [ "$basename_file" = "introduction.md" ]; then
        if ! grep -qi "Estimated Workshop Time.*:" "$file"; then
            # Insert after ## Introduction line
            if grep -q "^## Introduction" "$file"; then
                perl -i -0pe 's/(^## Introduction\n)/$1\nEstimated Workshop Time: TODO - x minutes\n/' "$file"
            else
                sed -i "2i\\Estimated Workshop Time: TODO - x minutes\\n" "$file"
            fi
            log_fixed "Added 'Estimated Workshop Time:' placeholder (update with actual time)"
            ((FILE_FIXES++))
        fi
    else
        if ! grep -qi "Estimated.*Time.*:" "$file"; then
            # Insert after ## Introduction line if it exists, else after H1
            if grep -q "^## Introduction" "$file"; then
                perl -i -0pe 's/(^## Introduction\n)/$1\nEstimated Time: TODO - x minutes\n/' "$file"
            else
                perl -i -0pe 's/(^# [^\n]+\n)/$1\nEstimated Time: TODO - x minutes\n/' "$file"
            fi
            log_fixed "Added 'Estimated Time:' placeholder (update with actual time)"
            ((FILE_FIXES++))
        fi
    fi

    # ----------------------------------------------------------------
    # Fix 11: Add Objectives section if missing
    # Inserted inside Introduction section if present, else after H1
    # ----------------------------------------------------------------
    if ! grep -q "^### Objectives" "$file" && ! grep -q "^## Objectives" "$file"; then
        if grep -q "^## Introduction" "$file"; then
            perl -i -0pe 's/(^## Introduction\n(?:.*\n)*?)(^## )/$1### Objectives\n\nIn this lab, you will:\n* TODO: Add objectives\n\n$2/m' "$file"
        else
            perl -i -0pe 's/(^# [^\n]+\n)/$1\n### Objectives\n\nIn this lab, you will:\n* TODO: Add objectives\n/' "$file"
        fi
        log_fixed "Added '### Objectives' section (update with actual objectives)"
        ((FILE_FIXES++))
    fi

    # ----------------------------------------------------------------
    # Fix 10: Add Introduction section if missing (only for files with Tasks)
    # ----------------------------------------------------------------
    if grep -q "^## Task" "$file" && ! grep -q "^## Introduction" "$file"; then
        # Insert Introduction before the first Task
        perl -i -0pe 's/(^## Task )/${\"\n## Introduction\n\nTODO: Add introduction text here.\n\n\"}$1/m' "$file"
        log_fixed "Added '## Introduction' section before first Task (update with actual content)"
        ((FILE_FIXES++))
    fi

    # ----------------------------------------------------------------
    # Fix 16-18: Fix indentation inside numbered steps (Python handles this)
    # ----------------------------------------------------------------
    indentation_fixed=$(python3 - "$file" <<'PY'
import sys, re

path = sys.argv[1]
with open(path, encoding='utf-8') as f:
    lines = f.readlines()

original = lines[:]

# Find all ## headings and ## Task headings
heading_indices = []
task_indices = []
for idx, raw in enumerate(lines):
    if re.match(r'^## ', raw):
        heading_indices.append(idx)
        if re.match(r'^## Task', raw):
            task_indices.append(idx)

fixes = 0
for start in task_indices:
    section_start = start + 1
    next_headings = [h for h in heading_indices if h > start]
    section_end = next_headings[0] if next_headings else len(lines)
    block = lines[section_start:section_end]
    if not block:
        continue

    has_ordered_list = any(re.match(r'[0-9]+\. ', ln) for ln in block)
    if not has_ordered_list:
        continue

    first_step_offset = None
    for offset, ln in enumerate(block):
        if re.match(r'[0-9]+\. ', ln):
            first_step_offset = offset
            break

    if first_step_offset is None:
        continue

    in_code_block = False
    for offset in range(first_step_offset, len(block)):
        ln = block[offset]
        raw_line = ln.rstrip('\n\r')
        stripped = raw_line.lstrip(' ')
        indent = len(raw_line) - len(stripped)
        abs_idx = section_start + offset

        if stripped.startswith('```'):
            if not in_code_block:
                in_code_block = True
                if indent < 4:
                    lines[abs_idx] = '    ' + stripped + '\n'
                    fixes += 1
            else:
                in_code_block = False
                if indent < 4 and stripped.rstrip() == '```':
                    lines[abs_idx] = '    ' + stripped + '\n'
                    fixes += 1
            continue

        if in_code_block:
            # Indent code block content too
            if indent < 4 and stripped:
                lines[abs_idx] = '    ' + stripped + '\n'
                fixes += 1
            continue

        if not stripped:
            continue

        if re.match(r'[0-9]+\. ', raw_line):
            continue

        if indent < 4:
            lines[abs_idx] = '    ' + stripped + '\n'
            fixes += 1

if fixes > 0:
    with open(path, 'w', encoding='utf-8') as f:
        f.writelines(lines)
    print(fixes)
PY
)

    indentation_fixed=$(echo "$indentation_fixed" | tr -d '[:space:]')
    if [ -n "$indentation_fixed" ] && [[ "$indentation_fixed" =~ ^[0-9]+$ ]] && [ "$indentation_fixed" -gt 0 ]; then
        log_fixed "Fixed indentation ($indentation_fixed lines) inside numbered steps"
        ((FILE_FIXES++))
    fi

    # ----------------------------------------------------------------
    # Report issues that need manual fixing
    # ----------------------------------------------------------------
    h1_count=$(grep -c "^# " "$file" 2>/dev/null || echo 0)
    first_content=$(grep -v '^$' "$file" | head -1)

    if [[ ! "$first_content" =~ ^#[^#] ]]; then
        log_skipped "Missing H1 title - add '# Your Lab Title' as the first line"
    fi

    if [ "$h1_count" -gt 1 ]; then
        log_skipped "Multiple H1 headers ($h1_count found) - manually remove extra H1s"
    fi

    open_copy=$(grep -c '<copy>' "$file" 2>/dev/null || echo 0)
    close_copy=$(grep -c '</copy>' "$file" 2>/dev/null || echo 0)
    open_copy=$(echo "$open_copy" | tr -d '[:space:]')
    close_copy=$(echo "$close_copy" | tr -d '[:space:]')
    if [ "$open_copy" -ne "$close_copy" ]; then
        log_skipped "Mismatched <copy> tags (open: $open_copy, close: $close_copy) - manually fix"
    fi

    task_headers=$(grep -n "^## Task" "$file" || true)
    if [ -n "$task_headers" ]; then
        while IFS= read -r line; do
            [ -z "$line" ] && continue
            if [[ ! "$line" =~ ^[0-9]+:##\ Task\ [0-9]+: ]]; then
                linenum=$(echo "$line" | cut -d: -f1)
                log_skipped "Task header at line $linenum doesn't follow '## Task N: Description' format - manually fix"
            fi
        done <<< "$task_headers"
    fi

    if [ $FILE_FIXES -eq 0 ]; then
        echo "  No auto-fixes needed"
    fi
    echo ""
done

echo "================================================"
echo "Summary"
echo "================================================"
echo "Auto-fixes applied : $FIXED"
echo "Manual fixes needed: $SKIPPED"
echo ""

if [ $SKIPPED -gt 0 ]; then
    echo -e "${YELLOW}Some issues require manual attention. Run the validator to see remaining errors.${NC}"
else
    echo -e "${GREEN}All fixable issues resolved. Run the validator to confirm.${NC}"
fi
