# Angle Architect  - Full Process Reference

This file contains the complete step-by-step instructions for the Angle Architect agent. Load this when executing the skill.

---

## Step 9: Build the Angle & Concept Bank (50 MINIMUM)

**Load before starting:**
- `references/05-copy-quality-and-style.md`  - quality standards

### Angle Types

Every angle falls into one of these 5 types:

1. **Problem**  - Address the specific frustration
2. **Benefit**  - Lead with what the product delivers
3. **Desire**  - Show the after state
4. **Failed Alternative**  - Call out what didn't work before
5. **Objection**  - Handle the reason they haven't bought

### The 40/40/20 Rule

#### 40% Proven Variations

Based on:
- Competitor winners (ads running 90+ days from Competitor Ads sheet)
- Highest-frequency review/Reddit themes (from Customer Intelligence data)
- Brand's own winning ad patterns (from Performance Analyst, if available)

Each must cite which data pattern inspired it. Example:
> "Inspired by competitor X's 90-day runner targeting price anxiety, combined with the #1 pain point from Trustpilot reviews: 'I had no idea what it would cost.'"

#### 40% Strategic Tests

From:
- Competitive messaging gaps (from Gap Matrix)
- Untapped pain points (from VOC Dictionary  - pains with high frequency but no competitor coverage)
- External research data (from Research Sources sheet)
- Organic social insights (from Organic Intelligence)

Each must cite which gap or data point supports it. Example:
> "Gap Matrix row 3: No competitor addresses the 'decision fatigue' pain. VOC Dictionary shows 12 verbatim quotes about feeling overwhelmed by choices."

#### 20% Wildcards

Bold, untested directions from the Creative Provocation Layer (in VOC Dictionary doc). Document WHY for each  - what's the hypothesis?

### Per Angle Documentation

Write `angle-bank.md` as a single table with these 15 columns:

| # | Column | Description |
|---|---|---|
| 1 | **Angle Name** | Short, descriptive name (e.g., "Price Transparency Guarantee") |
| 2 | **Angle Type** | Problem / Benefit / Desire / Failed Alternative / Objection |
| 3 | **Recommended Formats** | Which ad formats fit this angle best: UGC / Founder / Static / Carousel / Motion / B-Roll+VO. Can be multiple. This tells the copywriter WHAT to produce for this angle. A personal story angle = Founder/UGC. A stat-heavy angle = Static/Carousel. A demo angle = B-Roll+VO. |
| 4 | **Target Segment(s)** | Which segment(s) from the Blueprint |
| 5 | **Target Awareness Level(s)** | Unaware / Problem-Aware / Solution-Aware / Product-Aware / Most Aware |
| 6 | **Allocation** | Proven / Strategic / Wildcard |
| 7 | **Hook Line** | The opening line, built on a proven structure rather than invented |
| 8 | **Supporting Copy** | 2-3 sentences of body copy direction |
| 9 | **Emotional Trigger** | The core emotion this angle activates |
| 10 | **Evidence Trail** | Specific sources: "Trustpilot review #47, Gap Matrix row 3, Reddit r/kitchens thread" |
| 11 | **Why We Want to Produce This** | Strategic rationale for this specific angle |
| 12 | **Channel Fit** | Meta / TikTok / YouTube / Google / Multi-channel |
| 13 | **Certainty Level** | High / Medium / Low / Speculative |
| 14 | **Confidence Rating** | Strong / Moderate / Speculative (assigned after stress-test) |
| 15 | **Performance Alignment** | Matches winner pattern / Neutral / Matches loser pattern (flag!) / No data |
| 16 | **Status** | Draft / Stress-Tested / Priority: HIGH / Killed |

### Writing Hook Lines  - Structure First

**This is non-negotiable.** No hook line gets written from a blank page. The process:

1. Work from proven hook structures: the thought-read, the bold claim, the hype check, the negative bait, the direct address, the mistake reveal, the comparison, the confession
2. Read any swipe file or competitor hook library the operator supplied. Structures that already work in this market beat generic ones
3. For each angle, pick the structure that best matches its type, awareness level, and emotional trigger
4. Fill that structure with the brand's specific context using VOC language

**Example:**
- Template: "Nobody talks about [hidden truth] in [industry]"
- Adapted: "Nobody talks about the hidden costs in kitchen renovation"
- VOC enriched: "Nobody talks about how your 'free consultation' turns into 3 meetings before you even see a price"

Never write a hook from scratch when a proven template exists.

---

## Step 10: Stress-Test Angles + Output Validation

### 10a: Stress-Test

For each **Proven and Strategic** angle (40 total), interrogate the research corpus  - the
creative brief, VOC dictionary, gap matrix, review data and competitor analysis  - and answer:

> Does the data support the angle '{angle name}'? What evidence exists for '{hook line}'? What contradicts it?

For each angle, assess:
- **Evidence density**  - How many sources support this angle?
- **Contradictions**  - Does any data argue against this angle?
- **Differentiation**  - Is this angle distinct from competitors, or are they already running it?

**Wildcard angles skip stress-test**  - they're speculative by design.

### 10b: Assign Confidence Ratings

Based on stress-test results:

| Rating | Criteria |
|---|---|
| **Strong** | 3+ sources confirm. No contradictions. Clear whitespace. Historical performance alignment (if data available). |
| **Moderate** | 1-2 sources confirm. Minor contradictions. Some competitive overlap. |
| **Speculative** | Limited data. Inference-based. Worth testing but not leading with. |

**Kill rule:** If an angle has zero supporting evidence AND active contradictions, kill it. Replace with a new angle to maintain 50 minimum. Replacement angles must go through the same documentation process.

### 10c: Rank All 50 and Flag Top 20

Ranking criteria (in priority order):

1. **Historical winner alignment**  - Does this angle match patterns from the brand's winning ads? (If Performance Intelligence data available)
2. **VOC evidence strength**  - How many mentions, how high the certainty level?
3. **Competitive whitespace**  - Is any competitor running this angle? No competitor = higher potential.
4. **Emotional intensity**  - How strongly does the VOC language behind this angle resonate?

Apply the ranking. Flag the highest-potential angles with `Status: Priority: HIGH` in the sheet.

For each HIGH-priority angle, add a brief ranking rationale in the "Why We Want to Produce This" column (append to existing text):
> "RANKED #X  - Strong evidence (7 VOC mentions), no competitor coverage, aligns with brand's top-performing angle pattern."

### 10d: Output Validation

Run through every check and print results:

**Data Completeness:**
- [ ] All 12 review analysis categories populated
- [ ] Reddit research has findings in 5+ of 7 research elements
- [ ] At least 2 competitors fully analyzed
- [ ] LLM Element Research has findings in all 8 categories
- [ ] External research has 5+ sources

**Certainty Quality:**
- [ ] Certainty distribution: X% High, Y% Medium, Z% Low, W% Speculative
- [ ] If >50% Low/Speculative: WARN operator
- [ ] At least 5 High-certainty findings exist

**Deliverable Completeness:**
- [ ] Angle Bank covers the available evidence with no unexplored segment or gap
- [ ] Every angle has Evidence Trail populated
- [ ] VOC Dictionary has entries in all 8 categories
- [ ] Gap Matrix has 5+ ranked gaps
- [ ] Every segment has at least 1 ICP

**Cross-Source Validation:**
- [ ] At least 3 findings confirmed by 3+ source types
- [ ] No single-source findings promoted to High certainty

**Performance Alignment (if data available):**
- [ ] Winner patterns documented and referenced in angle evidence trails
- [ ] Loser patterns flagged against proposed angles

**Print the validation report:**

```
=== OUTPUT VALIDATION ===
Data Completeness:     {PASS/FAIL}
Certainty Quality:     {PASS/FAIL} (High: X%, Med: Y%, Low: Z%, Spec: W%)
Deliverable Complete:  {PASS/FAIL}
Cross-Source Valid:     {PASS/FAIL}
Performance Aligned:   {PASS/FAIL/SKIPPED}
Failures: {list or "None"}
```

If any check fails: print specific failures and ask operator whether to proceed or fix.

---

## Sheet Formatting

After writing all data to the Angle Bank sheet:

1. Bold the header row
2. Freeze row 1
3. Auto-resize all columns
4. Apply conditional formatting:
   - Priority: HIGH rows -> green background
   - Status: Killed rows -> red background with strikethrough
   - Allocation: Proven -> blue text, Strategic -> orange text, Wildcard -> purple text
5. Sort by Status (Priority: HIGH first), then by ranking position
