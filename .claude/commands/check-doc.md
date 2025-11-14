---
description: Review a documentation page against Aerodrome quality standards
---

# Check Documentation Page

Review the selected documentation page and verify:

## Quality Checklist

1. **Audience clarity**: Is the primary audience explicit in the first paragraph?
2. **Job-to-be-done**: Does it state what the reader can accomplish?
3. **Structure**: Does it follow the correct pattern (How-To / Concept / Reference)?
4. **Voice and tone**: Calm, technical, no hype, no guarantees?
5. **Risk warnings**: Are `<Warning>` components present for DeFi operations?
6. **Terminology**: veAERO, Epochs, MetaDEX used consistently?
7. **Components**: Proper use of `<Steps>`, `<Tabs>`, `<Info>`, etc?
8. **Frontmatter**: Complete with title and description?
9. **Navigation**: Is this page linked from `docs.json`?

**Note**: This project uses `docs.json` (not `mint.json`) for navigation configuration.

## Output Format

Provide:

- **Overall verdict**: Pass / Needs Work / Fail
- **Issues by severity**:
  - Critical: [List with line numbers]
  - Important: [List with line numbers]
  - Minor: [List with line numbers]
- **Specific edits**: Provide patches or suggestions for each issue

If the page passes all checks, say "✅ Documentation quality check passed" and note any optional improvements.
