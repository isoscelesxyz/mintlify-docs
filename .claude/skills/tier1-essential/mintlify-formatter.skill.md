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
  <Step title="First step">Content for first step</Step>
  <Step title="Second step">Content for second step</Step>
</Steps>
```

**Risk warnings** → `<Warning>` component:

```mdx
<Warning>Important risk information here</Warning>
```

**Helpful context** → `<Info>` component:

```mdx
<Info>Supplementary information here</Info>
```

**Pro tips** → `<Tip>` component:

```mdx
<Tip>Optimization or advanced tip here</Tip>
```

**Inline definitions** → `<Tooltip>` component:

```mdx
<Tooltip tip="The difference between quoted and executed price">slippage</Tooltip>
```

**Troubleshooting sections** → `<AccordionGroup>` component:

```mdx
## Troubleshooting

<AccordionGroup>
  <Accordion title="Common issue 1">Solution and explanation</Accordion>
  <Accordion title="Common issue 2">Solution and explanation</Accordion>
</AccordionGroup>
```

**Next steps navigation** → `<CardGroup>` component:

```mdx
## Next steps

<CardGroup cols={2}>
  <Card title="Related action" icon="icon-name" href="/path/to/page">
    Brief description
  </Card>
  <Card title="Learn more" icon="icon-name" href="/path/to/page">
    Brief description
  </Card>
</CardGroup>
```

**Protocol differences** → `<Tabs>` component:

```mdx
<Tabs>
  <Tab title="Aerodrome">Aerodrome-specific content</Tab>
  <Tab title="Velodrome">Velodrome-specific content</Tab>
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
4. Consider helpful patterns (when appropriate):
   - Add `<Tooltip>` on first use of advanced DeFi terms
   - Add `<AccordionGroup>` for troubleshooting if common issues exist
   - Add `<CardGroup>` for "Next steps" at the bottom
5. Ensure proper markdown syntax
6. Validate heading hierarchy
7. Add image paths if images are referenced
8. Check that code blocks have language specified

## Output

Always produce valid `.mdx` files that:

- Have complete frontmatter
- Use Mintlify components correctly
- Follow markdown best practices
- Are ready to preview with `mint dev`
