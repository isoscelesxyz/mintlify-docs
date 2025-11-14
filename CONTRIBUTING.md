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

## Content Guidelines

### Writing Style

- **Clear and concise**: Write for users of all experience levels
- **Action-oriented**: Use active voice and direct instructions
- **Consistent terminology**: Use Aerodrome-specific terms correctly:
  - veAERO (not veAero or VeAERO)
  - Epochs (7-day periods, Thursday-Wednesday)
  - MetaDEX (the underlying DEX model)

### Formatting

- Use proper heading hierarchy (H2 → H3 → H4)
- Include code blocks with language specified:
  ````mdx
  ```solidity
  // Your code here
  ```
  ````
- Add images to `/images/` directory
- Use relative paths for internal links

### MDX Components

Mintlify supports special components:
- `<Tip>`, `<Warning>`, `<Info>` for callouts
- `<Accordion>` for expandable sections
- `<Card>` and `<CardGroup>` for visual organization
- See [Mintlify docs](https://mintlify.com/docs) for more

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
