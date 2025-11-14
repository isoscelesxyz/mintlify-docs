---
name: Onchain Source Check
description: Validate contract addresses, token data, and numeric parameters against canonical sources
---

# Onchain Source Check Skill

This skill prevents fabricated data by enforcing that all addresses, parameters, and numeric values come from canonical sources.

## Critical Rule

**Never guess, estimate, or fabricate**:
- Contract addresses
- Token addresses
- ABI function signatures
- Numeric parameters (decimals, fees, multipliers)
- Emissions schedules
- Governance parameters

## Canonical Sources

### Contract Addresses

**Only from**:
1. `config/contracts/*.json` files (when repo has this structure)
2. MCP tool: `mcp__aero-registry__get_contract` (future)
3. Official documentation at: https://aerodrome.finance/security
4. Deployed contract verification on blockchain explorers

**Never from**:
- Memory or prior knowledge
- Other documentation sites
- Social media or Discord
- Unverified sources

### Token Metadata

**Only from**:
1. `config/tokens/*.json` files (when repo has this structure)
2. MCP tool: `mcp__token-registry__get_token` (future)
3. Verified blockchain data (on-chain token contract)
4. Official token lists

**Required fields**:
- Symbol (exact casing)
- Name (full name)
- Decimals (precise number)
- Address (checksummed)

### Emissions & Tokenomics

**Only from**:
1. Single authoritative page: `overview/tokenomics/emissions.mdx`
2. Smart contract source code
3. Official governance proposals

**Never duplicate** numeric parameters across pages. Link to the authoritative page instead.

### Governance Parameters

**Only from**:
1. Contract source code
2. Official governance documentation
3. On-chain governance proposals

## Validation Rules

### Address Validation

When a contract or token address appears:

```
✅ Valid pattern:
- Source cited: "From https://aerodrome.finance/security"
- Or: "See config/contracts/base.json"
- Or: Uses MCP tool to fetch

❌ Invalid pattern:
- Raw address with no source
- "The router address is 0x..."
- Memory or estimation
```

### Numeric Parameter Validation

When numeric values appear:

```
✅ Valid:
- "Emissions decay at 1% per epoch (see tokenomics/emissions)"
- "Fee is 0.3% (per Router.sol:L123)"
- Uses MCP tool to fetch current value

❌ Invalid:
- "Emissions are around 100k per week"
- "Fee is approximately 0.3%"
- Any unattributed number
```

## When Source is Unavailable

If a canonical source cannot be accessed:

1. **Insert placeholder**:
   ```
   TODO: VERIFY [contract address/parameter] FROM [source name]
   ```

2. **Do not proceed** with documentation

3. **Flag for human review**:
   ```
   ⚠️ BLOCKED: Cannot verify [data type] without access to [source]
   Requires: [specific source or MCP tool needed]
   ```

## Verification Checklist

Before allowing any address or parameter:

- [ ] Source is canonical (from approved list)
- [ ] Value is exact (not approximated)
- [ ] Source is cited inline or in comment
- [ ] If using MCP, tool call succeeded
- [ ] If unavailable, TODO placeholder inserted

## Common Violations

### ❌ Bad Examples

```mdx
The AERO token address is 0x940181a94A35A4569E4529A3CDfB74e38FD98631
```
No source cited.

```mdx
Emissions are roughly 100,000 AERO per week
```
Vague numeric claim without source.

```mdx
The router fee is about 0.3%
```
"About" indicates guessing.

### ✅ Good Examples

```mdx
The AERO token address on Base is `0x940181a94A35A4569E4529A3CDfB74e38FD98631`
([verified on Basescan](https://basescan.org/address/0x940181a94A35A4569E4529A3CDfB74e38FD98631))
```
Source cited with link.

```mdx
Weekly emissions decay at 1% per epoch. See the complete emissions schedule
in [Tokenomics > Emissions](/overview/tokenomics/emissions).
```
Links to authoritative page.

```mdx
TODO: VERIFY Router address FROM config/contracts/base.json
```
Proper placeholder when source unavailable.

## Usage Pattern

When validating data:

1. Detect addresses (0x... patterns)
2. Detect numeric parameters (decimals, percentages, amounts)
3. Check for citation or source
4. If missing, verify against canonical sources
5. If source unavailable, insert TODO and block
6. If verification fails, flag as error
7. Output validation report

## Output Format

```
Source Validation Results:

✅ Verified:
- Line 12: AERO address verified from basescan
- Line 45: Emissions value links to canonical page

❌ Unverified (BLOCKING):
- Line 23: Router address has no source cited
  → Insert: TODO: VERIFY Router address FROM config/contracts/base.json

- Line 67: "~100k emissions" is approximate
  → Replace with exact value and source

⚠️ Needs Review:
- Line 89: Fee parameter references old docs
  → Verify against current contract code
```
