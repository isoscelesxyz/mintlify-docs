// ESLint Configuration for Aerodrome Finance Documentation
// Using ESLint 9+ flat config format
// NOTE: MDX/Markdown linting handled by markdownlint (see .markdownlint.jsonc)
// This config only handles JavaScript/TypeScript files

import js from '@eslint/js'

export default [
  // Ignore patterns (files to skip)
  {
    ignores: [
      '**/node_modules/**',
      '**/.git/**',
      '**/ai-notes/**',
      '**/.pnpm-store/**',
      '**/dist/**',
      '**/build/**',
      '**/.next/**',
      '**/.vscode/**',
      '**/pnpm-lock.yaml',
      '**/.DS_Store',
      '**/*.png',
      '**/*.jpg',
      '**/*.svg',
      '**/*.ico',
      // Skip MDX and MD files for now (Prettier handles formatting)
      '**/*.mdx',
      '**/*.md',
    ],
  },

  // Base JavaScript/TypeScript rules
  js.configs.recommended,

  // Global rules for JavaScript files
  {
    files: ['**/*.{js,mjs,cjs,jsx,ts,tsx}'],
    rules: {
      'no-console': 'off',
      'no-irregular-whitespace': 'error',
    },
  },
]
