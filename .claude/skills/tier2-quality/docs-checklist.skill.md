---
name: Docs Checklist
description: Comprehensive quality checklist for Aerodrome documentation pages
---

# Docs Checklist Skill

This skill enforces the complete quality bar for Aerodrome documentation, checking all requirements before a page is considered ready.

## 9-Point Quality Checklist

### 1. Audience Clarity ✓

**Check**: Is the primary audience explicit in the first paragraph?

**Requirements**:
- First paragraph should identify: End User, Protocol Team, Developer, or Advanced User
- Or: Use "You will learn..." pattern that implies audience
- Content complexity should match stated audience

**Examples**:
```mdx
✅ "You will learn how to provide liquidity..." (implies End User)
✅ "This guide is for protocol teams launching new tokens..." (explicit)
❌ No audience statement at all
❌ "This page covers everything about pools" (vague, no audience)
```

---

### 2. Job-to-be-Done ✓

**Check**: Does the page state what the reader can accomplish?

**Requirements**:
- Clear action reader can take after reading
- Stated in opening paragraph
- Specific, not vague

**Examples**:
```mdx
✅ "You will learn how to lock AERO and start earning protocol revenue"
✅ "This reference lists all contract addresses you need to integrate"
❌ "This page is about veAERO" (no job stated)
❌ "Learn about governance" (too vague)
```

---

### 3. Structure Pattern ✓

**Check**: Does the page follow the correct pattern for its type?

**How-To Guide requirements**:
- [ ] Opens with "You will learn how to..."
- [ ] Has "Before you begin" section
- [ ] Uses `<Steps>` for procedures
- [ ] Has "Next steps" section

**Concept Page requirements**:
- [ ] Opens with "In this concept..."
- [ ] Explains mental model
- [ ] Includes concrete example
- [ ] Has "Where to go next"

**Reference Page requirements**:
- [ ] Brief description of reference material
- [ ] Uses tables for structured data
- [ ] Minimal explanations (links to concepts)
- [ ] Links to related guides

---

### 4. Voice and Tone ✓

**Check**: Is the writing calm, technical, and neutral?

**Requirements**:
- [ ] Uses second person ("you")
- [ ] Uses active voice
- [ ] Short sentences (avg 10-20 words)
- [ ] No hype or marketing language
- [ ] No absolute claims ("guaranteed", "risk-free")
- [ ] No emojis in body text
- [ ] No speculation or price predictions

---

### 5. Risk Warnings ✓

**Check**: Are appropriate risk warnings present?

**Requires `<Warning>` component if page covers**:
- Liquidity provision
- Token locking
- Governance voting
- Any operation involving funds

**Must mention**:
- Smart contract risk
- Impermanent loss (for liquidity)
- Governance risk (for voting)
- "Verify addresses" reminder

**Example**:
```mdx
✅
<Warning>
  Providing liquidity involves smart contract risk and impermanent loss.
  Only deposit funds you can afford to lose. Always verify contract
  addresses from official sources.
</Warning>
```

---

### 6. Terminology Consistency ✓

**Check**: Are protocol terms used correctly?

**Requirements**:
- [ ] veAERO (not veAero, VeAERO)
- [ ] Epochs (capitalized for concept)
- [ ] MetaDEX (not Meta-DEX, metaDEX)
- [ ] Gauges, Bribes, Emissions (capitalized for concepts)
- [ ] AERO/VELO (all caps for token tickers)

---

### 7. Mintlify Components ✓

**Check**: Are Mintlify components used correctly?

**Component usage rules**:
- [ ] `<Steps>` for 2+ sequential actions
- [ ] `<Warning>` for risks (not `<Callout type="warning">`)
- [ ] `<Info>` for helpful context
- [ ] `<Tip>` for pro tips
- [ ] `<Tabs>` for Aero vs Velo differences
- [ ] Code blocks have language specified

**Examples**:
```mdx
✅ <Steps><Step title="Connect wallet">...</Step></Steps>
❌ 1. Connect wallet (plain numbered list for procedure)

✅ <Warning>Smart contract risk...</Warning>
❌ **Warning**: Smart contract risk... (bold text instead of component)
```

---

### 8. Complete Frontmatter ✓

**Check**: Does the page have proper frontmatter?

**Requirements**:
```yaml
---
title: "Clear, concise page title"
description: "One-sentence summary (max 160 chars)"
---
```

**Rules**:
- Title: Concise, descriptive, title case
- Description: Complete sentence, under 160 characters, no period at end

---

### 9. Navigation Integration ✓

**Check**: Is the page linked in `docs.json`?

**Requirements**:
- [ ] Page path exists in `docs.json` navigation
- [ ] Path matches file location exactly (without `.mdx`)
- [ ] Page appears in correct tab and group
- [ ] At least one internal link TO this page exists (discoverability)

---

## Data Accuracy Checks (Critical)

**Contract Addresses**:
- [ ] All addresses have sources cited
- [ ] No hardcoded addresses without verification
- [ ] Addresses are checksummed if shown

**Numeric Parameters**:
- [ ] All numbers have sources
- [ ] No "approximately" or "around" values
- [ ] Links to authoritative page for emissions/parameters

**If source unavailable**:
- [ ] Uses `TODO: VERIFY [data] FROM [source]` placeholder
- [ ] Flagged for human review

---

## Optional Quality Enhancements

**Recommended but not required**:
- [ ] Screenshots or diagrams for complex UI
- [ ] Code examples for developer content
- [ ] "What you'll need" callout before steps
- [ ] Success indicators ("You should now see...")
- [ ] Troubleshooting section for common issues
- [ ] External links open in new tab

---

## Usage Pattern

When checking a page:

1. Identify page type (How-to / Concept / Reference)
2. Run through all 9 critical checks
3. Check data accuracy (addresses, numbers)
4. Note optional enhancements
5. Assign severity to each issue (Critical / Important / Minor)
6. Provide specific line numbers for issues
7. Suggest concrete fixes

---

## Output Format

```
Documentation Quality Report

Page: [filename]
Type: [How-to / Concept / Reference]
Audience: [Detected or stated]

CRITICAL ISSUES (must fix before merge):
❌ 1. Audience Clarity (Line 1)
   → Add: "You will learn how to..." or state target audience

❌ 5. Risk Warnings (Missing)
   → Add <Warning> component for smart contract risk

❌ 8. Frontmatter (Incomplete)
   → Missing "description" field

IMPORTANT ISSUES (should fix):
⚠️ 3. Structure Pattern
   → Line 45: Use <Steps> component instead of numbered list

⚠️ 6. Terminology
   → Line 23: "veAero" should be "veAERO"

MINOR ISSUES (consider):
💡 Optional: Add screenshot of UI for Step 2
💡 Optional: Include troubleshooting section

DATA ACCURACY:
✅ No addresses or numeric parameters detected
   OR
❌ Line 67: Router address has no source
   → Add source: [link or config file]

OVERALL VERDICT:
[PASS / NEEDS WORK / FAIL]

Status: [number] critical, [number] important, [number] minor issues
Ready for merge: [YES / NO - fix critical issues first]
```
