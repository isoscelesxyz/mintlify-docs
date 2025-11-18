---
name: DeFi Domain Context
description: Shared protocol knowledge and terminology for Aerodrome/Velodrome documentation
---

# DeFi Domain Context Skill

This skill provides canonical definitions and usage rules for Aerodrome/Velodrome protocol concepts, ensuring consistency across all documentation.

## Core Terminology

### veAERO / veVELO

**Definition**: Vote-escrowed AERO/VELO tokens - locked tokens that grant governance rights and revenue share

**Capitalization**: Always "veAERO" (not "veAero", "VeAERO", "veaero")

**Usage**:

- "Lock AERO to receive veAERO"
- "veAERO holders earn protocol revenue"
- "Your veAERO balance determines voting power"

**Link to**: `/overview/core-features/lock/locking-aero` when first mentioned

---

### Epochs

**Definition**: 7-day governance and emissions cycles (Thursday 00:00 UTC to Wednesday 23:59 UTC)

**Capitalization**: Capitalize when referring to the concept, lowercase in general use

**Usage**:

- "Epochs run from Thursday to Wednesday" (concept)
- "Rewards are distributed at the end of each epoch"
- "Vote before the epoch ends"

**Link to**: `/overview/getting-started/key-concepts#epochs` when first mentioned

---

### Gauges

**Definition**: Voting mechanisms that direct AERO emissions to specific liquidity pools

**Usage**:

- "Vote on gauges to direct emissions"
- "Each pool has a corresponding gauge"
- "Gauge weights determine emission distribution"

**Link to**: `/overview/core-features/voting/voting` when explaining voting

---

### Bribes / Incentives

**Definition**: Additional rewards deposited by protocols to attract votes to their pool's gauge

**Terminology**: Use "incentives" in user-facing docs, "bribes" in technical/advanced docs

**Usage**:

- User docs: "Protocols offer incentives to attract voters"
- Technical: "Bribe contracts hold external incentives"

**Link to**: `/overview/core-features/incentives/incentives`

---

### Emissions

**Definition**: AERO tokens distributed weekly to liquidity providers based on gauge votes

**Usage**:

- "Weekly emissions are distributed to staked LPs"
- "Emissions decay at 1% per epoch"
- "Gauge votes determine emission allocation"

**Link to**: `/overview/tokenomics/emissions` for schedules and parameters

---

### MetaDEX

**Definition**: Next-generation DEX model where 100% of protocol revenue goes to voters as incentives

**Capitalization**: Always "MetaDEX" (not "Meta-DEX", "metaDEX", "meta DEX")

**Usage**:

- "Aerodrome uses the MetaDEX model"
- "MetaDEX aligns LP, voter, and protocol incentives"

**Link to**: `/overview/overview#the-metadex-flywheel`

---

### ve(3,3)

**Definition**: Economic model combining vote-escrow (ve) tokenomics with (3,3) game theory from OlympusDAO

**Usage**:

- "Built on ve(3,3) economics"
- "The ve(3,3) model encourages long-term alignment"

**Do not expand**: Do not write "vote-escrow three-three" in user docs

---

### CL Pools

**Definition**: Concentrated Liquidity pools (Uniswap v3 style) with capital efficiency

**Alternative terms**: "Concentrated pools", "slipstream pools" (for Velodrome)

**Usage**:

- "CL pools offer greater capital efficiency"
- "Choose between basic pools and CL pools"

**Link to**: `/overview/core-features/liquidity-pools/concentrated-pools`

---

### Basic Pools / Stable Pools

**Definition**: Constant product (x\*y=k) or stableswap pools for correlated assets

**Usage**:

- "Basic pools use the x\*y=k formula"
- "Stable pools are optimized for correlated assets like USDC/USDT"

**Link to**: `/overview/core-features/liquidity-pools/basic-pools`

---

## Usage Rules

### When to Link vs Define

**First mention on a page**: Link to concept page

```mdx
Lock your AERO as [veAERO](/overview/core-features/lock/locking-aero) to earn protocol revenue.
```

**Subsequent mentions**: No link needed

```mdx
Your veAERO balance determines your voting power.
```

**Exception**: If the term is the main topic of the page, define it in an intro paragraph instead of linking

---

### Protocol-Specific Terminology

**Aerodrome (Base)**:

- Token: AERO
- veToken: veAERO
- Chain: Base

**Velodrome (Optimism)**:

- Token: VELO
- veToken: veVELO
- Chain: Optimism
- CL pools called: "Slipstream"

When writing for both protocols, use `<Tabs>` for differences.

---

### Avoid These Mistakes

❌ **Don't**:

- "veAero" (wrong capitalization)
- "Aero token" (inconsistent, use "AERO")
- "The epoch is a week long" (awkward phrasing)
- Redefine terms on every page
- Use "bribe" in beginner docs (use "incentive")

✅ **Do**:

- "veAERO" (correct capitalization)
- "AERO token" or just "AERO"
- "Epochs are 7-day periods"
- Link to concept pages on first mention
- Use "incentive" for general audience

---

## Checking Terminology

When reviewing or writing docs:

1. Scan for core terms (veAERO, Epochs, Gauges, etc.)
2. Verify correct capitalization
3. Check that first mention has a link to concept page
4. Ensure definitions match canonical descriptions
5. Flag any made-up or informal terms
6. Suggest protocol-specific `<Tabs>` if mixing Aero/Velo

---

## Output Format

```
Terminology Check:

✅ Correct Usage:
- Line 12: "veAERO" capitalized correctly
- Line 23: First mention links to concept page

❌ Incorrect Usage:
- Line 45: "veAero" → should be "veAERO"
- Line 67: "Bribe" in user doc → use "incentive"

⚠️ Missing Links:
- Line 89: First mention of "Epochs" has no link
  → Add link: [Epochs](/overview/getting-started/key-concepts#epochs)
```
