---
name: Tone Enforcer
description: Validate and enforce Aerodrome documentation voice and tone standards
---

# Tone Enforcer Skill

This skill validates documentation against Aerodrome's voice and tone guidelines, catching violations and suggesting corrections.

## Voice Standards

Documentation should be:
- **Calm and technical**: No hype, no marketing language, no speculation
- **Direct and precise**: Use second person ("you"), active voice, short sentences
- **Risk-aware**: Always mention relevant risks for DeFi operations
- **Neutral on outcomes**: Never promise yields, returns, or specific results

## Forbidden Content Detection

Scan for and flag these violations:

### Absolute Claims (Critical)
❌ Forbidden terms:
- "guaranteed"
- "risk-free"
- "safe yield"
- "zero risk"
- "no risk"
- "always profitable"
- "certain returns"

✅ Compliant alternatives:
- "may provide" instead of "guarantees"
- "potential yield" instead of "safe yield"
- "consider the risks" instead of "risk-free"

### Investment Advice (Critical)
❌ Never recommend:
- Specific trading strategies
- Buy/sell timing
- Price predictions
- Expected returns
- Optimal investment amounts

✅ Instead use:
- "Users can choose to..."
- "Consider your risk tolerance..."
- "Evaluate the trade-offs..."

### Speculative Language (Important)
❌ Avoid:
- "will moon"
- "going to pump"
- "token going to explode"
- Price predictions or targets
- Market timing advice

### Style Violations (Important)
❌ Flag:
- Emojis in body text (🚀, 💰, 🔥, etc.)
- Excessive slang ("degen", "ape in", "WAGMI" in formal docs)
- First person ("we", "us", "our team")
- Passive voice where active is better
- Overly long sentences (>25 words)

✅ Preferred:
- Second person: "you", "your"
- Active voice: "You provide liquidity" not "Liquidity is provided"
- Short sentences: 10-20 words average

## Sentence Analysis

Check for:
- **Sentence length**: Flag sentences over 30 words
- **Passive voice**: Suggest active alternatives
- **Clarity**: Flag jargon without definition
- **Person**: Ensure consistent second person

## Risk Language Requirements

For pages covering:
- Liquidity provision
- Token locking
- Governance voting
- Yield strategies

**Must include**:
- Smart contract risk mention
- Impermanent loss warning (for liquidity)
- Governance risk (for voting)
- "Verify contract addresses" reminder

## Correction Format

When violations are found, provide:

```
Line X: [CRITICAL/IMPORTANT/MINOR] Forbidden term "guaranteed"
Suggestion: Replace with "may provide" or remove claim entirely
```

## Usage Pattern

When checking tone:

1. Scan for forbidden absolute claims (critical)
2. Check for investment advice (critical)
3. Detect speculative language (important)
4. Flag style violations (minor)
5. Validate sentence structure
6. Verify risk warnings are present where needed
7. Provide specific line-by-line corrections

## Output Format

```
Tone Check Results:

Critical Issues (must fix):
- Line 12: Forbidden term "risk-free"
- Line 45: Investment advice detected

Important Issues (should fix):
- Line 23: Emoji in body text
- Line 67: Passive voice, suggest active

Minor Issues (consider):
- Line 34: Long sentence (38 words)
- Line 89: Slang term "ape in"

Risk Warnings:
✅ Smart contract risk mentioned
❌ Missing impermanent loss warning (recommended for liquidity guides)
```
