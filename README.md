# Aerodrome Documentation

Official documentation for [Aerodrome Finance](https://aerodrome.finance) - the essential trading hub and liquidity marketplace on Base.

Built with [Mintlify](https://mintlify.com/), a modern documentation platform that makes it easy to create and maintain beautiful docs.

## Local Development

### Prerequisites

**Node.js**: Version 19 or higher is required (v24+ recommended)

- Use `nvm use` to automatically switch to the correct version (reads from `.nvmrc`)
- Or manually install Node.js v19+ from [nodejs.org](https://nodejs.org)

### Setup

1. **Install dependencies** (optional but recommended):
   ```bash
   pnpm install
   ```

2. **Install Mintlify CLI globally** (required):
   ```bash
   # Using pnpm (recommended)
   pnpm add -g mint

   # Or using npm
   npm i -g mint
   ```

### Running the Docs Locally

From the repository root (where `docs.json` is located):

```bash
# Using npm script
pnpm dev

# Or directly with mint CLI
mint dev
```

The documentation site will be available at `http://localhost:3000` with hot reload enabled.

### Making Changes

1. Edit the `.mdx` files in the repository
2. The dev server will automatically reload with your changes
3. Preview your changes in the browser before committing

## Project Structure

```
.
├── docs.json              # Mintlify configuration (navigation, theme, settings)
├── overview/              # Core Aerodrome documentation
├── development/           # Developer resources
├── help/                  # Support and FAQs
├── changelog/             # Product updates
├── images/                # Image assets
└── logo/                  # Brand assets
```

For detailed guidance on content organization and where to place new pages, see [CONTRIBUTING.md](./CONTRIBUTING.md).

## Publishing Changes

Changes pushed to the main branch are automatically deployed to production. No manual deployment steps required.

## Troubleshooting

### Common Issues

- **Dev server not starting**:
  - Ensure Node.js v19+ is installed: `node --version`
  - Run `mint update` to get the latest CLI version
  - Clear cache: `pnpm clear` or `mint clear`

- **404 errors**:
  - Verify you're running `mint dev` from the directory containing `docs.json`
  - Check that the file path in `docs.json` navigation matches the actual `.mdx` file location

- **Content not updating**:
  - Verify `.mdx` files have proper frontmatter (title, description)
  - Ensure the page is referenced in `docs.json` navigation
  - Try clearing the cache: `mint clear`

- **`mint` command not found**:
  - Install the CLI globally: `pnpm add -g mint`
  - Or use npm: `npm i -g mint`

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines on how to contribute to this documentation.

## Resources

- [Aerodrome Finance](https://aerodrome.finance)
- [Mintlify Documentation](https://mintlify.com/docs)
- [Support Discord](https://discord.gg/aerodrome)
