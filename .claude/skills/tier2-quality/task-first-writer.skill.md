---
name: Task-First Writer
description: Structure documentation around concrete user jobs and actionable outcomes
---

# Task-First Writer Skill

This skill enforces task-oriented documentation structure, ensuring every page enables readers to complete a concrete job.

## Core Principle

**Every page must answer**: "What can the reader DO after reading this?"

If a page doesn't enable a concrete action, it should be:

- Split into actionable components
- Merged with a task-oriented page
- Reconsidered for removal

## Page Type Patterns

### How-To Guide Structure

**Purpose**: Enable reader to complete a specific task

**Required sections**:

1. **Opening statement** (required):

   ```mdx
   You will learn how to [specific task] and why it matters for [outcome].
   ```

2. **Before you begin** (if prerequisites exist):

   ```mdx
   ## Before you begin

   Before [task], ensure you have:

   - [Specific prerequisite for this task]
   - [Required technical setup]
   - [Specific access or permission needed]
   ```

   **DO NOT include basic assumptions**:
   - ❌ "You need a wallet" (assumed for all DeFi)
   - ❌ "You need ETH for gas" (basic DeFi requirement)
   - ❌ "Understand smart contract risks" (link to disclaimers instead)

   **DO include task-specific prereqs**:
   - ✅ "You need veAERO to vote on gauges"
   - ✅ "Your lock must expire before you can withdraw"
   - ✅ "Complete KYC verification for this feature"

3. **Steps** (required):

   ```mdx
   ## [Action verb] [object]

   <Steps>
     <Step title="First action">Detailed instructions with screenshots if helpful</Step>
     <Step title="Second action">More instructions</Step>
   </Steps>
   ```

4. **Verification** (recommended):

   ```mdx
   ## Verify your [result]

   You should now see/have [expected outcome].
   ```

5. **Next steps** (required):

   ```mdx
   ## Next steps

   Now that you've [completed task], you can:

   - [Related task 1] - link
   - [Related task 2] - link
   - [Advanced topic] - link
   ```

**Example opening**:

```mdx
You will learn how to provide liquidity to an Aerodrome pool and why concentrated
liquidity pools can improve your capital efficiency.
```

---

### Concept Page Structure

**Purpose**: Explain a mental model or system

**Required sections**:

1. **In this concept** (required):

   ```mdx
   In this concept, you'll understand [system/model] and how it [benefits/works].
   ```

2. **Mental model** (required):
   - Explain the "why" before the "what"
   - Use analogies or comparisons
   - Define key terms

3. **Concrete example** (required):
   - Simple, relatable scenario
   - Show how concept applies in practice

4. **Where to go next** (required):

   ```mdx
   ## Where to go next

   - **Apply this concept**: [Related how-to guide]
   - **Learn more**: [Advanced concept]
   - **See in action**: [Reference or example]
   ```

**Example opening**:

```mdx
In this concept, you'll understand how Epochs coordinate governance and emissions
cycles, ensuring synchronized protocol operations.
```

---

### Reference Page Structure

**Purpose**: Provide quick lookup for addresses, parameters, APIs

**Required sections**:

1. **Brief description** (required):

   ```mdx
   This reference lists [type of information] for [protocol/system].
   ```

2. **Structured data** (required):
   - Use tables for addresses, parameters, endpoints
   - Include all necessary columns (name, value, link, notes)
   - Sort logically (alphabetical, by importance, by category)

3. **Code examples** (if applicable):
   - Show common usage patterns
   - Include error handling
   - Link to full documentation

4. **Related guides** (required):
   - Link to how-to guides that use this reference
   - Link to concepts that explain the reference

**Keep minimal**:

- Reference pages should be scannable
- Avoid lengthy explanations (link to concepts instead)
- Focus on accurate, structured data

---

## Job-to-be-Done Clarity

Each page should explicitly state the job:

### ✅ Good Examples

```mdx
# Provide Liquidity to a Pool

You will learn how to deposit tokens into an Aerodrome liquidity pool and start
earning trading fees.
```

Clear job: deposit tokens, earn fees

```mdx
# Understanding veAERO Voting Power

In this concept, you'll understand how your veAERO balance and lock duration
determine your voting power in governance.
```

Clear job: understand voting power mechanics

```mdx
# Contract Addresses

This reference lists all deployed Aerodrome contracts on Base, including routers,
factories, and core protocol contracts.
```

Clear job: look up contract addresses

### ❌ Bad Examples

```mdx
# Liquidity Pools

Liquidity pools are an important part of Aerodrome.
```

No clear job, vague topic

```mdx
# All About veAERO

veAERO is really cool and powerful.
```

Marketing language, no specific job

```mdx
# Things to Know

Here are some things about the protocol.
```

No focus, unclear purpose

---

## Audience-Job Alignment

Verify the stated job matches the target audience:

| Audience       | Good Jobs                                                   | Bad Jobs                                |
| -------------- | ----------------------------------------------------------- | --------------------------------------- |
| End Users      | "Swap tokens", "Provide liquidity", "Vote on gauges"        | "Integrate our API", "Deploy contracts" |
| Protocol Teams | "Create a gauge", "Incentivize voters"                      | "Debug transaction errors"              |
| Developers     | "Integrate Router contract", "Query Sugar API"              | "Decide which pool to use"              |
| Advanced Users | "Optimize veAERO lock duration", "Analyze emission weights" | "Basic wallet setup"                    |

---

## Usage Pattern

When writing or reviewing:

1. **Identify page type**: How-to, Concept, or Reference?
2. **Extract the job**: What can the reader do after reading?
3. **Check structure**: Does it follow the pattern for its type?
4. **Verify sections**: Are all required sections present?
5. **Test clarity**: Is the job explicitly stated in the opening?
6. **Check audience fit**: Does the job match the stated audience?
7. **Suggest improvements**: Missing sections, unclear jobs, mismatched audience

---

## Output Format

```
Task-Oriented Structure Check:

Page Type: [How-to / Concept / Reference]
Stated Job: [What reader can do after reading]
Target Audience: [End User / Protocol Team / Developer / Advanced]

✅ Structure Check:
- Opening statement clearly states job
- "Before you begin" section present
- Steps use <Steps> component
- "Next steps" section links to related content

❌ Missing Elements:
- Line 1: Opening should state "You will learn how to..."
- Missing "Before you begin" section (add prerequisites)
- Steps not wrapped in <Steps> component

⚠️ Recommendations:
- Consider splitting into two pages: [Task 1] and [Task 2]
- Job is unclear, clarify what reader accomplishes
- Audience mismatch: content is too advanced for "End User"
```
