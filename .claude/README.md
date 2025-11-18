# Claude Code AI Infrastructure for Aerodrome Docs

This directory contains the AI infrastructure that powers documentation workflows for Aerodrome Finance. It includes output styles, agents, skills, commands, and hooks that enforce quality standards and accelerate documentation creation.

## Quick Start

### For Writing New Documentation

**Option 1: Interactive page creation**

```
/new-doc-page
```

Answers 5 questions, then creates a properly structured page.

**Option 2: Use the docs-writer agent**

```
Use the docs-writer agent to create a how-to guide for [topic]
```

The agent will draft a complete `.mdx` file with proper structure, components, and risk warnings.

### For Reviewing Documentation

**Option 1: Quick quality check**

```
/check-doc
```

Runs a 9-point quality checklist on the selected page.

**Option 2: Comprehensive review**

```
Use the docs-reviewer agent to review [filename].mdx
```

Provides detailed feedback with severity-based issues and specific corrections.

---

## Directory Structure

```
.claude/
├── settings.json              # Project configuration
├── output-styles/
│   └── docs-mode.md          # Global docs behavior rules
├── commands/
│   ├── new-doc-page.md       # Interactive page creation
│   └── check-doc.md          # Quality review command
├── skills/
│   ├── tier1-essential/      # Core formatting and validation
│   │   ├── mintlify-formatter.skill.md
│   │   ├── tone-enforcer.skill.md
│   │   └── onchain-source-check.skill.md
│   └── tier2-quality/        # Content quality and structure
│       ├── defi-domain-context.skill.md
│       ├── task-first-writer.skill.md
│       └── docs-checklist.skill.md
├── agents/
│   ├── docs-writer.md        # Draft new pages
│   └── docs-reviewer.md      # Review pages
├── hooks/
│   ├── hooks.json            # Hook configuration
│   └── mintlify-check.sh     # Frontmatter validation
└── README.md                 # This file
```

---

## Output Style: Docs Mode

**Automatically active** for all Claude Code sessions in this project.

Enforces:

- Task-oriented structure ("You will learn how to...")
- Second person, active voice, short sentences
- Risk warnings for DeFi operations
- No "guaranteed", "risk-free", or speculation
- Proper page structure (Before you begin, Steps, Next steps)

**Location**: `.claude/output-styles/docs-mode.md`

---

## Slash Commands

### `/new-doc-page`

Interactive page creation workflow.

**Asks**:

1. Primary audience (End User / Protocol Team / Developer / Advanced)
2. Job to be done (what reader will accomplish)
3. Page type (How-To / Concept / Reference)
4. Protocol (Aerodrome / Velodrome / Both)
5. Risk level (requires warnings?)

**Creates**:

- Complete `.mdx` file with frontmatter
- Proper structure for page type
- Risk warnings if needed
- Reminds you to update `docs.json`

**Usage**: Type `/new-doc-page` in Claude Code

---

### `/check-doc`

Quick quality review against standards.

**Checks**:

- Audience clarity
- Job-to-be-done stated
- Correct structure pattern
- Voice and tone compliance
- Risk warnings present
- Terminology consistency
- Mintlify components usage
- Frontmatter complete
- Navigation integration

**Output**:

- Pass / Needs Work / Fail verdict
- Issues by severity (Critical / Important / Minor)
- Specific corrections with line numbers

**Usage**: Type `/check-doc` after selecting a file

---

## Agents

### Docs Writer Agent

**Purpose**: Draft new documentation pages with proper structure and accuracy.

**Attached Skills**:

- defi-domain-context (protocol terminology)
- mintlify-formatter (Mintlify components)
- tone-enforcer (voice validation)
- task-first-writer (structure enforcement)
- onchain-source-check (data accuracy)

**Usage**:

```
Use the docs-writer agent to create a [page type] for [topic]
```

**Examples**:

```
Use the docs-writer agent to create a how-to guide for providing liquidity to CL pools

Use the docs-writer agent to create a concept page explaining Epochs

Use the docs-writer agent to create a reference page for contract addresses
```

**Output**:

- Complete `.mdx` file
- Navigation reminder (where to add in `docs.json`)
- Any areas needing verification

---

### Docs Reviewer Agent

**Purpose**: Comprehensive quality review with actionable feedback.

**Attached Skills**:

- docs-checklist (9-point quality check)
- tone-enforcer (voice validation)
- defi-domain-context (terminology)
- onchain-source-check (data verification)
- mintlify-formatter (formatting validation)

**Usage**:

```
Use the docs-reviewer agent to review [filename].mdx
```

**Output**:

- Overall verdict (Pass / Needs Work / Fail)
- Critical issues (must fix before merge)
- Important issues (should fix)
- Minor issues (consider)
- Data accuracy check
- Specific corrections with line numbers

---

## Skills

Skills are reusable micro-behaviors that agents use to enforce standards.

### Tier 1: Essential Skills

**mintlify-formatter.skill.md**

- Auto-generates frontmatter
- Maps content to Mintlify components (`<Steps>`, `<Warning>`, `<Tabs>`)
- Ensures proper markdown structure

**tone-enforcer.skill.md**

- Scans for forbidden terms (guaranteed, risk-free)
- Detects investment advice and speculation
- Flags emojis, hype, passive voice
- Provides corrections

**onchain-source-check.skill.md**

- Validates contract addresses have sources
- Prevents fabricated numeric parameters
- Enforces `TODO: VERIFY FROM [source]` pattern

### Tier 2: Quality Skills

**defi-domain-context.skill.md**

- Canonical definitions (veAERO, Epochs, MetaDEX, Gauges)
- Capitalization rules
- When to link vs define
- Protocol-specific terminology

**task-first-writer.skill.md**

- Enforces "You will learn..." pattern
- Generates proper structure (How-To / Concept / Reference)
- Validates job-to-be-done clarity
- Checks audience-job alignment

**docs-checklist.skill.md**

- 9-point quality checklist
- Severity-based issue reporting
- Data accuracy verification
- Navigation integration check

---

## Hooks

Hooks run automatically after certain events to catch issues.

### PostToolUse Hook (Mintlify Validation)

**Triggers**: After Write or Edit operations on `.mdx` files

**Checks**:

- Frontmatter has `title` field
- Frontmatter has `description` field
- Frontmatter is properly closed with `---`
- Description is under 160 characters (warning)

**Location**: `.claude/hooks/mintlify-check.sh`

**Result**:

- ✅ Pass: File proceeds normally
- ❌ Fail: Error message shown, must fix to continue

---

### Stop Hook (Compliance Check)

**Triggers**: Before Claude Code sends output to user

**Checks**:

- Forbidden terms: "guaranteed", "risk-free", "safe yield"
- Investment advice or trading recommendations
- Price predictions or speculation
- Emojis in prose

**Result**:

- ✅ Allow: Output proceeds normally
- 🛑 Block: Output blocked, must revise

**Note**: This runs on _model output_, not on files. It catches violations during generation.

---

## Workflows

### Creating a New How-To Guide

1. **Start with command**:

   ```
   /new-doc-page
   ```

2. **Answer prompts**:
   - Audience: End User
   - Job: "Provide liquidity and earn fees"
   - Type: How-To Guide
   - Protocol: Aerodrome
   - Risk level: Yes

3. **Review the draft**:
   - Check structure (You will learn, Before you begin, Steps, Next steps)
   - Verify `<Warning>` component present
   - Confirm frontmatter complete

4. **Add to navigation**:
   - Edit `docs.json`
   - Add path to appropriate tab/group
   - Example: `"overview/core-features/deposit/provide-liquidity"`

5. **Test locally**:

   ```bash
   mint dev
   ```

6. **Review before commit**:
   ```
   /check-doc
   ```

---

### Reviewing an Existing Page

1. **Select the file** in Claude Code

2. **Run review**:

   ```
   Use the docs-reviewer agent to review [filename].mdx
   ```

3. **Fix critical issues**:
   - Address all "Critical" items first
   - These block merge

4. **Consider important issues**:
   - "Important" issues impact quality
   - Should be fixed but not blocking

5. **Optional improvements**:
   - "Minor" issues are nice-to-haves
   - Fix if time permits

6. **Re-review** after changes

---

### Creating Protocol-Specific Content

For content that differs between Aerodrome (Base) and Velodrome (Optimism):

**Option 1: Use `<Tabs>` component**

```mdx
<Tabs>
  <Tab title="Aerodrome">Aerodrome-specific content here</Tab>
  <Tab title="Velodrome">Velodrome-specific content here</Tab>
</Tabs>
```

**Option 2: Separate pages**

- Create `aerodrome/[topic].mdx`
- Create `velodrome/[topic].mdx`
- Use when differences are substantial

**Let the agent decide**: The `docs-writer` agent will suggest the best approach based on the differences.

---

## Best Practices

### When Writing

✅ **Do**:

- Start with the job to be done
- Use second person ("you")
- Keep sentences short (10-20 words)
- Include risk warnings for DeFi operations
- Cite sources for addresses and data
- Link to concept pages on first mention

❌ **Don't**:

- Use "guaranteed", "risk-free", "safe yield"
- Make price predictions or investment advice
- Use emojis in body text
- Guess contract addresses or parameters
- Write vague "about X" pages without clear jobs

### When Reviewing

✅ **Do**:

- Run `/check-doc` or use reviewer agent
- Fix critical issues before merging
- Verify risk warnings are present
- Check all addresses have sources
- Test page locally with `mint dev`

❌ **Don't**:

- Skip quality checks
- Merge with critical issues
- Ignore data accuracy violations
- Forget to add page to `docs.json`

---

## Troubleshooting

### Hook Not Running

**Problem**: PostToolUse hook doesn't execute after editing `.mdx` files

**Solutions**:

- Verify `mintlify-check.sh` is executable: `chmod +x .claude/hooks/mintlify-check.sh`
- Check `hooks.json` path matches: `"$CLAUDE_PROJECT_DIR/.claude/hooks/mintlify-check.sh"`
- Ensure file path matches filter: `**/*.mdx`

### Agent Not Using Skills

**Problem**: Agent doesn't apply formatting or validation rules

**Solutions**:

- Verify skill files exist in `.claude/skills/`
- Check agent frontmatter lists skills correctly
- Restart Claude Code session to reload configuration

### Output Style Not Active

**Problem**: Claude Code doesn't follow docs-mode behavior

**Solutions**:

- Verify `.claude/settings.json` has `"outputStyle": "Docs Mode"`
- Check output style file exists: `.claude/output-styles/docs-mode.md`
- Restart Claude Code session

### Command Not Found

**Problem**: `/new-doc-page` or `/check-doc` doesn't work

**Solutions**:

- Verify command files exist in `.claude/commands/`
- Check file extensions are `.md`
- Restart Claude Code session

---

## Extending the System

### Adding New Skills

1. Create skill file in appropriate tier directory
2. Follow naming convention: `[skill-name].skill.md`
3. Include frontmatter with name and description
4. Attach to relevant agents by adding to their `skills:` list

### Adding New Agents

1. Create agent file in `.claude/agents/`
2. Include frontmatter with name, description, tools, and skills
3. Document the agent's workflow and purpose
4. Test with sample tasks

### Adding New Commands

1. Create command file in `.claude/commands/`
2. Include frontmatter with description
3. Document the command's behavior
4. Reference agents or skills as needed

---

## Support

**For questions about**:

- **AI infrastructure**: See this README
- **Documentation content**: See [CONTRIBUTING.md](../CONTRIBUTING.md)
- **Mintlify setup**: See [README.md](../README.md)
- **Aerodrome protocol**: See [docs.aerodrome.finance](https://docs.aerodrome.finance)

**For issues**:

- AI infrastructure bugs → Open GitHub issue
- Documentation quality → Use `/check-doc` or docs-reviewer agent
- Content questions → Ask in [Discord](https://discord.gg/aerodrome)
