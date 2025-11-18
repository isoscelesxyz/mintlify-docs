---
description: Create a new Mintlify documentation page with proper structure
---

# New Documentation Page

I need to create a new documentation page. Before writing, ask me:

1. **Primary audience**: End User / Protocol Team / Developer / Advanced User?
2. **Job to be done**: What will the reader be able to do after reading?
3. **Page type**: How-To Guide / Concept Page / Reference Page?
4. **Protocol**: Aerodrome / Velodrome / Both (use tabs)?
5. **Risk level**: Does this involve DeFi operations requiring risk warnings?

Once you have this information:

1. Determine the appropriate directory:
   - End user content → `overview/`
   - Developer content → `development/`
   - Support content → `help/`
   - Product updates → `changelog/`

2. Create the `.mdx` file with proper frontmatter:

   ```yaml
   ---
   title: "Clear, concise page title"
   description: "One-sentence summary for SEO (max 160 chars)"
   ---
   ```

3. Follow the content structure pattern for the page type (see CLAUDE.md)

4. Include `<Warning>` component if risk level is relevant

5. Consider helpful patterns when appropriate:
   - `<Tooltip>` on first use of advanced DeFi terms
   - `<AccordionGroup>` for troubleshooting (if common issues exist)
   - `<CardGroup>` for "Next steps" at the bottom

6. After creating the file, remind me to:
   - Add the page path to `docs.json` navigation
   - Verify the page appears in `mint dev`
