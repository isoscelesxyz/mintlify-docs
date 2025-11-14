---
name: Mintlify Formatter
description: Convert content into properly formatted Mintlify documentation pages
---

# Mintlify Formatter Skill

This skill converts raw content or notes into valid Mintlify documentation with proper structure and components.

## Formatting Rules

### Frontmatter Generation

Every `.mdx` file must start with complete frontmatter:

```yaml
---
title: "Clear, concise page title"
description: "One-sentence summary for SEO and previews (max 160 chars)"
---
```

### Component Mapping

Automatically wrap content in appropriate Mintlify components:

**Sequential instructions** → `<Steps>` component:
```mdx
<Steps>
  <Step title="First step">
    Content for first step
  </Step>
  <Step title="Second step">
    Content for second step
  </Step>
</Steps>
```

**Risk warnings** → `<Warning>` component:
```mdx
<Warning>
  Important risk information here
</Warning>
```

**Helpful context** → `<Info>` component:
```mdx
<Info>
  Supplementary information here
</Info>
```

**Pro tips** → `<Tip>` component:
```mdx
<Tip>
  Optimization or advanced tip here
</Tip>
```

**Protocol differences** → `<Tabs>` component:
```mdx
<Tabs>
  <Tab title="Aerodrome">
    Aerodrome-specific content
  </Tab>
  <Tab title="Velodrome">
    Velodrome-specific content
  </Tab>
</Tabs>
```

**Code examples** → Always specify language:
````mdx
```solidity
// Solidity code here
```
````

### Structural Rules

- Use proper heading hierarchy: H2 → H3 → H4 (never skip levels)
- Use absolute paths for images: `/images/filename.svg`
- Use relative paths for internal links: `../other-page`
- Keep paragraphs short (2-4 sentences max)
- Use bullet lists for non-sequential items

## Usage Pattern

When given content to format:

1. Generate appropriate frontmatter
2. Identify structural elements (steps, warnings, tips, tabs)
3. Wrap in correct Mintlify components
4. Ensure proper markdown syntax
5. Validate heading hierarchy
6. Add image paths if images are referenced
7. Check that code blocks have language specified

## Output

Always produce valid `.mdx` files that:
- Have complete frontmatter
- Use Mintlify components correctly
- Follow markdown best practices
- Are ready to preview with `mint dev`
