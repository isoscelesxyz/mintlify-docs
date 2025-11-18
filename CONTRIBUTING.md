# Contributing to Aerodrome Documentation

Thank you for contributing to the Aerodrome Finance documentation! This guide will help you get started.

## Getting Started

1. **Fork and clone** the repository
2. **Install prerequisites**: Node.js v19+ (see [README.md](./README.md))
3. **Install Mintlify CLI**: `pnpm add -g mint`
4. **Run locally**: `pnpm dev` or `mint dev`

## Making Changes

### Editing Existing Pages

1. Find the `.mdx` file you want to edit in the repository
2. Make your changes using Markdown/MDX syntax
3. Preview locally at `http://localhost:3000`
4. Commit your changes with a clear message

### Creating New Pages

1. **Create the `.mdx` file** in the appropriate directory:
   - Core docs → `overview/`
   - Developer resources → `development/`
   - Help content → `help/`
   - Updates → `changelog/`

2. **Add frontmatter** to your new file:

   ```mdx
   ---
   title: "Page Title"
   description: "Brief description for SEO and previews"
   ---
   ```

3. **Update `docs.json`** to add the page to navigation:
   - Find the appropriate tab and group
   - Add your page path (without `.mdx` extension)
   - Example: `"overview/new-page"` for `overview/new-page.mdx`

4. **Verify** the page appears in the navigation during `mint dev`

### Updating Navigation

Edit `docs.json` to modify:

- **Tabs**: Top-level navigation sections
- **Groups**: Sections within each tab
- **Pages**: Individual documentation pages
- **Icons**: Using [Font Awesome](https://fontawesome.com/icons) icon names

**Important**: All page paths in `docs.json` must match actual `.mdx` file locations.

## Content Quality Standards

### Documentation Philosophy

Documentation for Aerodrome Finance is **task-oriented, not marketing**. Every page should enable the reader to complete at least one concrete job. If a page does not serve a clear user task, consider splitting it into actionable components or removing it.

### Audience Tiers

When creating content, identify your primary audience:

1. **End Users (DeFi participants)**
   - Goal: Swap tokens, provide liquidity, earn rewards, participate in governance
   - Needs: Step-by-step guides, clear risk warnings, prerequisite checks
   - Examples: "How to provide liquidity", "How to vote with veAERO"

2. **Protocol Teams and Token Issuers**
   - Goal: Launch tokens, bootstrap liquidity, attract voters
   - Needs: Incentive mechanics, gauge strategy, emissions optimization
   - Examples: "How to create a gauge", "How to incentivize voters"

3. **Developers and Integrators**
   - Goal: Build on top of Aerodrome, integrate contracts, fetch data
   - Needs: API references, contract addresses, technical specifications
   - Examples: "Sugar API reference", "Contract addresses"

4. **Advanced Users (veAERO holders, governance participants)**
   - Goal: Optimize voting strategy, understand tokenomics, governance decisions
   - Needs: Deep dives on mechanics, emissions schedules, protocol design
   - Examples: "veAERO mechanics", "Emissions and decay"

### Voice and Tone

Documentation should be:

- **Calm and technical**: No hype, no marketing language, no speculation
- **Direct and precise**: Use second person ("you"), active voice, short sentences
- **Risk-aware**: Always mention relevant risks (smart contract risk, impermanent loss, governance risk)
- **Neutral on outcomes**: Never promise yields, returns, or specific results

### Forbidden Content

Never include:

- Recommendations for specific trades or investment strategies
- Terms like "guaranteed", "risk-free", "safe yield", or similar absolute claims
- Price predictions or speculation on token valuations
- Emojis in documentation body text (emojis are allowed in UI elements, not prose)
- Excessive slang or casual language that undermines technical credibility

### Risk Posture

When covering liquidity provision, staking, locking, or governance:

- Always include a clearly marked risk callout using Mintlify's `<Warning>` component
- Mention smart contract risk, governance risk, and impermanent loss where relevant
- Encourage readers to verify contract addresses from official sources
- Never encourage leverage, looping, or high-risk strategies without explicit risk warnings

### Content Structure Patterns

**For How-To Guides:**

1. Start with "You will learn how to X and why it matters"
2. Include a `## Before you begin` section with prerequisites
3. Use numbered steps with clear headings
4. End with `## Next steps` linking to related content

**For Concept Pages:**

1. Start with "In this concept" summary
2. Explain the mental model and why it matters
3. Provide a simple, concrete example
4. End with "Where to go next"

**For Reference Pages:**

1. Start with brief description of the reference material
2. Use tables for structured data (addresses, parameters, endpoints)
3. Include code examples where relevant
4. Keep explanations minimal (link to concepts for details)

### Writing Style

- **Clear and concise**: Write for users of all experience levels
- **Action-oriented**: Use active voice and direct instructions
- **Consistent terminology**: Use Aerodrome-specific terms correctly:
  - veAERO (not veAero or VeAERO)
  - Epochs (7-day periods, Thursday-Wednesday)
  - MetaDEX (the underlying DEX model)
  - ve(3,3) (the economic model)
  - Gauges, Bribes, Emissions (capitalize when referring to the concepts)

### Formatting

- Use proper heading hierarchy (H2 → H3 → H4)
- Include code blocks with language specified:
  ````mdx
  ```solidity
  // Your code here
  ```
  ````
- Add images to `/images/` directory
- Use absolute paths for images: `/images/filename.svg`
- Use relative paths for internal documentation links

### Mintlify Components

Mintlify supports special components for better content structure:

**Callouts:**

- `<Warning>` - For risks and critical warnings (always use for financial/security risks)
- `<Info>` - For helpful context and supplementary information
- `<Tip>` - For pro tips and optimizations

**Organization:**

- `<Steps>` - For sequential instructions (use for any process with 2+ steps)
- `<Tabs>` - For protocol/chain differences (Aerodrome vs Velodrome, Base vs Optimism)
- `<Accordion>` - For expandable FAQ-style content
- `<Card>` and `<CardGroup>` - For visual navigation cards

**Code:**

- `<CodeGroup>` - For multi-language code examples

**Component Usage Rules:**

- Always use `<Warning>` (not `<Callout type="warning">`) for risks
- Use `<Steps>` for any process with 2+ sequential actions
- Use `<Tabs>` when content differs by protocol or chain (not for general alternatives)
- Keep code blocks focused (one concept per block, with language specified)

See [Mintlify docs](https://mintlify.com/docs) for complete component reference

## Testing Your Changes

Before submitting a pull request:

1. **Run locally**: Ensure `mint dev` works without errors
2. **Check navigation**: Verify new pages appear in the correct location
3. **Review formatting**: Check that MDX renders correctly
4. **Test links**: Ensure all internal and external links work
5. **Preview images**: Verify images load and display properly

## Submitting Changes

1. **Create a branch**: `git checkout -b feature/your-change`
2. **Commit changes**: Use clear, descriptive commit messages
3. **Push to your fork**: `git push origin feature/your-change`
4. **Open a Pull Request**: Describe your changes and why they're needed

### Pull Request Guidelines

- Provide a clear description of what changed and why
- Reference any related issues
- Ensure all changes are tested locally
- Be responsive to feedback during review

## Deployment

Changes merged to `main` are automatically deployed to production via Mintlify's GitHub integration. No manual deployment is required.

## Questions?

- Join the [Aerodrome Discord](https://discord.gg/aerodrome)
- Check the [Mintlify documentation](https://mintlify.com/docs)
- Open an issue for documentation bugs or suggestions

Thank you for helping improve Aerodrome's documentation!
