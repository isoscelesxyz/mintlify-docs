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

## Common Issues

**Dev server won't start**: Run `mint update` to get latest CLI version

**404 errors**: Verify `mint dev` is run from directory containing `docs.json`

**Page not showing in nav**: Check path in `docs.json` exactly matches `.mdx` file location

**Content not updating**: Verify `.mdx` formatting and that file is referenced in `docs.json`
