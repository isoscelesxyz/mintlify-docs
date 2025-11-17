# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

## Project Overview

This is the **Aerodrome Finance documentation site** built with Mintlify. Aerodrome is a decentralized exchange (DEX) on Base that uses the MetaDEX model to align swappers, liquidity providers, and tokenholders through a ve(3,3) economic design.

## Key Terminology (Domain Model)

When writing documentation, use these terms consistently:

- **`AERO`** - The protocol token. Always format as `AERO` (with backticks) in markdown to distinguish it as a token symbol
- **veAERO** - Vote-escrowed AERO tokens (locked AERO for governance). Always capitalize as "veAERO", never "veAero" or "VeAERO"
- **Epochs** - 7-day periods (Thursday 00:00 UTC to Wednesday 23:59 UTC). Capitalize when referring to the concept
- **MetaDEX** - Next-generation DEX model where 100% of protocol revenue goes to voters as incentives
- **Gauges** - Voting mechanisms for directing emissions to liquidity pools
- **CL Pools** - Concentrated Liquidity pools (as opposed to Basic/Stable pools)
- **ve(3,3)** - The economic model combining vote-escrow (ve) tokenomics with the (3,3) game theory from OlympusDAO
- **Bribes** - Incentives deposited by protocols to attract votes to their gauges
- **Emissions** - AERO tokens distributed weekly to liquidity providers based on gauge votes

## Docs Purpose and Audiences

### Documentation Philosophy

Documentation for Aerodrome Finance is **task-oriented, not marketing**. Every page should enable the reader to complete at least one concrete job. If a page does not serve a clear user task, propose splitting it into actionable components or removing it.

### Audience Tiers

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

### Content Quality Bar

When creating or reviewing documentation:

- **Audience clarity**: Explicitly identify the primary audience in the first paragraph
- **Job-to-be-done**: State what the reader will be able to do after reading
- **Actionable**: Include concrete steps, not just concepts
- **Audience fit**: Verify content matches audience expectations (no governance deep-dives in beginner guides)

## Voice and Tone

### Style Guidelines

Documentation should be:

- **Calm and technical**: No hype, no marketing language, no speculation
- **Direct and precise**: Use second person ("you"), active voice, short sentences
- **Risk-aware**: Always mention relevant risks (smart contract risk, impermanent loss, governance risk)
- **Neutral on outcomes**: Never promise yields, returns, or specific results

### Forbidden Content

Never:

- Recommend specific trades or investment strategies
- Use "guaranteed", "risk-free", "safe yield", or similar absolute terms
- Make price predictions or speculate on token valuations
- Use emojis in documentation body text (allowed in UI elements, not prose)
- Use excessive slang or casual language

### Risk Posture

**Use `<Warning>` components only for page-specific risks**:
- Risks unique to that particular operation or feature
- Technical gotchas specific to that page's content
- Critical safety issues that apply to that specific action

**Examples of appropriate inline warnings**:
- "CL pools require active management to stay in range"
- "Relocking extends your lock duration - you cannot unlock early"
- "Voting locks your tokens for the full epoch"

**DO NOT include generic warnings in every page**:
- ❌ "You need a wallet" (basic assumption)
- ❌ "Smart contracts have risks" (covered in disclaimers)
- ❌ "Impermanent loss exists" (unless specific to that pool type)
- ❌ "Verify contract addresses" (general best practice)

**For general protocol risks**: Link to [Before You Begin](/overview/getting-started/before-you-begin) instead of repeating generic warnings on every page.

**Never encourage**:
- Leverage, looping, or high-risk strategies
- Specific investment amounts or timing
- Trading strategies or price predictions

## Mintlify Conventions

### Required Frontmatter

Every `.mdx` page must include:

```yaml
---
title: "Clear, concise page title"
description: "One-sentence summary for SEO and previews (max 160 chars)"
---
```

### Content Structure Patterns

**Important**: These patterns are **strong suggestions, not strict requirements**. Apply them when they genuinely help users. Skip patterns that would be forced or redundant for a particular page.

**For How-To Guides:**

1. Start with "You will learn how to X and why it matters"
2. Include `## Before you begin` section with prerequisites (when needed)
3. Use numbered steps with clear headings
4. End with `## Next steps` linking to related content

**For Concept Pages:**

1. Start with "In this concept" summary
2. Explain the mental model and why it matters
3. Provide a simple, concrete example (when helpful)
4. End with `## Next steps` (when helpful)

**For Reference Pages:**

1. Start with brief description of the reference material
2. Use tables for structured data (addresses, parameters, endpoints)
3. Include code examples where relevant
4. Keep explanations minimal (link to concepts for details)

### Mintlify Components to Use

- `<Steps>` for sequential instructions
- `<Warning>` for risk callouts and critical warnings
- `<Info>` for helpful context and tips
- `<Tip>` for pro tips and optimizations
- `<Tooltip>` for inline definitions of technical terms and acronyms
- `<Accordion>` and `<AccordionGroup>` for troubleshooting sections and expandable FAQs
- `<Card>` and `<CardGroup>` for "Next steps" navigation sections
- `<Tabs>` for multi-chain differences (Base vs Optimism) or version comparisons
- `<CodeGroup>` for multi-language code examples

### Component Usage Rules

- Always use `<Warning>` (not `<Callout type="warning">`) for risks
- Use `<Steps>` for any process with 2+ sequential actions
- Use `<Tabs>` when content differs by protocol or chain (not for general alternatives)
- Keep code blocks focused (one concept per block, with language specified)

### Helpful Patterns (Use When Appropriate)

**Use pragmatically**: Apply these patterns when they genuinely help users. Don't force them just for consistency.

**1. Inline definitions with `<Tooltip>`:**
- On the first use of advanced DeFi terms, wrap them in a tooltip
- Example: `<Tooltip tip="The difference between quoted and executed price">slippage</Tooltip>`
- Common terms to tooltip: slippage, price impact, impermanent loss, liquidity depth, concentrated liquidity, vote-escrow, bribes, emissions, rebases

**2. Troubleshooting sections with `<AccordionGroup>`:**
- Add to how-to guides **only when users actually face common issues**
- Use `## Troubleshooting` heading
- Each common issue gets its own `<Accordion>` with descriptive title
- **Skip if**: Page is conceptual, or no known user problems exist
- Example topics: "Transaction fails", "Can't find token", "High slippage warning"

**3. Next steps with `<CardGroup>`:**
- Add at the very bottom of pages (after troubleshooting if present)
- Use `## Next steps` heading
- Include 2-4 related pages as cards with icons
- Guide users to logical next actions or related concepts

**When to skip patterns:**
- Concept pages don't need "Before you begin" (they're not guides)
- Pages without common user issues don't need "Troubleshooting"
- Don't add sections just to match a template—add them when they help users

Example structure for a complete how-to guide:
```mdx
## How to [do thing]
<Steps>...</Steps>

## Troubleshooting
<AccordionGroup>
  <Accordion title="Common issue 1">...</Accordion>
  <Accordion title="Common issue 2">...</Accordion>
</AccordionGroup>

## Next steps
<CardGroup cols={2}>
  <Card title="Related action" icon="..." href="...">...</Card>
  <Card title="Learn more" icon="..." href="...">...</Card>
</CardGroup>
```

### Technical Implementation Notes

- All pages are `.mdx` files (Markdown with JSX support)
- **Navigation configuration**: This project uses `docs.json` (NOT `mint.json`) for navigation
- Navigation paths must match actual file locations exactly
- Images go in `/images/` and are referenced with absolute paths: `/images/filename.svg`
- Changes to `main` branch auto-deploy to production (no manual deployment)

## Canonical Sources (Source of Truth)

### Critical Rule: Never Guess Data

When documenting addresses, parameters, or numeric values:

- **Always** pull from canonical sources (listed below)
- **Never** guess, estimate, or use placeholder values
- **If unavailable**: Write `TODO: VERIFY FROM [source]` and flag for review

### Canonical Data Sources

**Contract addresses:**

- Only from: `config/contracts/*.json` (when repo structure supports this)
- Or: MCP tool `mcp__aero-registry__get_contract` (future)
- Or: Official Aerodrome docs at https://aerodrome.finance/security

**Token metadata (names, symbols, decimals):**

- Only from: `config/tokens/*.json` (when repo structure supports this)
- Or: MCP tool `mcp__token-registry__get_token` (future)
- Or: Verified blockchain data via MCP

**Emissions schedules, decay rates, epoch timing:**

- Only from: Single reference page in `overview/tokenomics/emissions.mdx`
- Never duplicate numeric parameters across multiple pages
- Link to authoritative page instead

**Governance parameters (quorum, voting periods):**

- Only from: Contract source code or official governance docs
- Document source in comments when adding to documentation

### When Source is Unavailable

If you cannot access a canonical source:

1. Write `TODO: VERIFY [description] FROM [source name]`
2. Do not proceed with the documentation
3. Flag for human review
