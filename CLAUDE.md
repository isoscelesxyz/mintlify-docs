# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **Aerodrome Finance documentation site** built with Mintlify. Aerodrome is a decentralized exchange (DEX) on Base that uses the MetaDEX model to align swappers, liquidity providers, and tokenholders.

## Development Commands

### Local Development
```bash
# Install Mintlify CLI (if not already installed)
pnpm add -g mint

# Start dev server
mint dev
# Runs at http://localhost:3000 with hot reload
```

### Maintenance
```bash
# Update Mintlify CLI to latest version
mint update
```

## Architecture & Key Concepts

### Mintlify Configuration
- **`docs.json`** - Central configuration file defining:
  - Navigation structure (tabs, groups, page order)
  - Theme colors, branding, metadata
  - Search, footer, navbar settings
  - All navigation paths must match actual `.mdx` file locations

### Content Organization
Documentation follows a tabbed structure defined in `docs.json`:

1. **Overview Tab** - Core product documentation
   - Getting Started → Introduction to Aerodrome
   - Core Features → Liquidity pools, swapping, locking, voting, rewards, incentives
   - Tokenomics, Security, Contributors

2. **Development Tab** - Developer resources
   - Sugar API, data analytics, third-party integrations

3. **Help Tab** - User support
   - Discord, troubleshooting, FAQs

4. **Changelog Tab** - Product updates

### Content Files
- All documentation pages are **`.mdx`** files (Markdown with JSX support)
- Each page has frontmatter with `title` and `description`
- Files referenced in `docs.json` navigation must exist at the exact path specified

### Key Terminology (Aerodrome-Specific)
- **veAERO** - Vote-escrowed AERO tokens (locked AERO for governance)
- **Epochs** - 7-day periods (Thursday 00:00 UTC to Wednesday 23:59 UTC)
- **MetaDEX** - Next-gen DEX model where 100% of protocol revenue goes to voters
- **Gauges** - Voting mechanisms for directing emissions to liquidity pools
- **CL Pools** - Concentrated Liquidity pools

## Workflow Considerations

### When Editing Navigation
1. Update `docs.json` navigation structure
2. Ensure all referenced paths point to existing `.mdx` files
3. Test with `mint dev` to verify navigation works

### When Creating New Pages
1. Create `.mdx` file in appropriate directory
2. Add frontmatter (title, description)
3. Add page path to `docs.json` navigation
4. Verify page appears in nav during `mint dev`

### When Working with Images/Assets
- Place images in `/images/` directory
- Reference with absolute paths: `/images/filename.svg`
- Logos are in `/logo/` (light.svg, dark.svg)

### Auto-deployment
- Changes pushed to `main` branch automatically deploy to production
- No manual deployment steps required

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
When covering liquidity provision, staking, locking, or governance:
- Always include a clearly marked risk callout using Mintlify's `<Warning>` component
- Mention smart contract risk, governance risk, and impermanent loss where relevant
- Encourage readers to verify contract addresses from official sources
- Never encourage leverage, looping, or high-risk strategies

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

**For How-To Guides:**
1. Start with "You will learn how to X and why it matters"
2. Include `## Before you begin` section with prerequisites
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

### Mintlify Components to Use

- `<Steps>` for sequential instructions
- `<Warning>` for risk callouts and critical warnings
- `<Info>` for helpful context and tips
- `<Tip>` for pro tips and optimizations
- `<Tabs>` for Aerodrome vs Velodrome or Base vs Optimism differences
- `<CodeGroup>` for multi-language code examples

### Component Usage Rules
- Always use `<Warning>` (not `<Callout type="warning">`) for risks
- Use `<Steps>` for any process with 2+ sequential actions
- Use `<Tabs>` when content differs by protocol or chain (not for general alternatives)
- Keep code blocks focused (one concept per block, with language specified)

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

## Common Issues

**Dev server won't start**: Run `mint update` to get latest CLI version

**404 errors**: Verify `mint dev` is run from directory containing `docs.json`

**Page not showing in nav**: Check path in `docs.json` exactly matches `.mdx` file location

**Content not updating**: Verify `.mdx` formatting and that file is referenced in `docs.json`
