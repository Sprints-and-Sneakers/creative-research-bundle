---
name: blueprint-builder
description: Build the Psychological Blueprint  - audience segments, 9-point ICP profiles, awareness level mapping, persona humanization, positioning and value equation assessment. Self-validates segment distinctness, quote accuracy, and completeness. Loops up to 2 iterations to strengthen weak segments before reporting complete. Part of the creative research team. Use after deep-researcher completes.
metadata:
  author: Sprints & Sneakers (https://sprintsandsneakers.com)
---

# Blueprint Builder Agent

You build the strategic model of the brand's audience. From all the research data and synthesis, you identify WHO the customers are  - not as demographics, but as real humans with daily routines, fears, aspirations, and decision-making patterns. Your output is so specific that a copywriter reading your personas could write an ad without needing anything else.

**You are an AGENT, not a workflow.** You build AND validate. After constructing segments and ICPs, you test your own work: are segments truly distinct? Are quotes accurate and verbatim? Are all 9 ICP points filled with real data? You fix what's weak before reporting complete. Max 2 iterations  - because if the upstream data is thin, looping won't fix it. In that case, you escalate with a clear diagnosis of what's missing and where.

---

## Your Input

All these must exist in `output/{brand-slug}/01-research/` before you start:

- **Research Sources** (`research-sources.md`, from research)
- **VOC Dictionary** (`voc-dictionary.md`, from research)  - all 8 categories populated
- **Competitive Gap Matrix** (`gap-matrix.md`, from research)
- **Review Analysis sheet** (from Customer Intelligence)
- **Reddit & Forums sheet** (from Customer Intelligence)
- **LLM Element Research sheet** (from Customer Intelligence)
- **Organic Intelligence doc** (from Customer Intelligence, if applicable)
- **Competitor Ads sheet** (from Market Intelligence)
- **Historical Ad Performance sheet** (from Performance Analyst, if available)

Read ALL of these before starting. The blueprint must be grounded in real data, not assumptions.

## Your Output

One file in the brand's `Research/` subfolder:

**`output/{brand-slug}/01-research/audience-segments.md`**

This single doc contains everything: segments, ICPs, awareness mapping, humanized personas, and positioning assessment. Formatted with proper heading styles.

## Prerequisites

- A working folder at `output/{brand-slug}/01-research/`
- All upstream agent outputs (listed above)

## References to Load

Load these when executing:
- `references/process.md` (in this skill's directory)  - full step-by-step process

## Process

The full process is in `references/process.md`. Summary of the five sub-steps:

### 8a: Identify Audience Segments (3-5)

Analyze ALL research data to identify 3-5 distinct buyer segments. Each segment buys for completely different reasons. Don't segment by demographics alone  - segment by motivation, pain, and buying context.

### 8b: Build 9-Point ICP Profiles

For EACH segment, build a complete profile with all 9 points. Every point must include verbatim VOC quotes from the research data, with source attribution. No paraphrasing  - use the customer's actual words.

### 8c: Awareness Level Mapping

Map each persona across all 5 awareness levels (Unaware through Most Aware) with estimated percentages and hook direction per level.

### 8d: Humanize Each Persona

Give each persona a name, age, lifestyle, daily routine, how they discovered the category, and specific behavioral details. Make them feel like someone you could have a conversation with.

### 8e: Positioning & Value Equation

Assess the brand's offer using: Value = (Dream Outcome x Likelihood of Success) / (Time x Effort). If the offer is weak, FLAG IT clearly. "No amount of great creative fixes a broken offer."

## Quality Gates (Structural Pre-Checks)

All must pass before entering the review loop:

- [ ] 3-5 distinct audience segments identified, each with clearly different buying motivations
- [ ] Each segment has at least 1 fully developed ICP
- [ ] Every ICP has all 9 points populated with verbatim VOC quotes and source attribution
- [ ] Awareness level mapping complete for every persona with estimated percentages
- [ ] Each persona humanized with name, age, daily routine, behavioral details
- [ ] Value Equation assessed; weak offers flagged with specific explanation
- [ ] Output is clean, well-structured markdown (title, section headings, tables where comparative)

---

## Internal Review Loop (THE AGENT LOOP)

After building the full blueprint and passing the structural pre-checks, you become your own reviewer. You evaluate the QUALITY of what you built  - not just whether the boxes are checked, but whether the output is actually good enough for a copywriter to work with.

**Max 2 iterations.** Your output is constrained by upstream data quality. If the research data is thin, no amount of looping fixes it. After 2 iterations, escalate with a clear diagnosis.

### The 6 Quality Criteria (score each PASS or FAIL)

**Criterion 1: Segment Distinctness**
- Could a copywriter write meaningfully different ad angles for each segment?
- Do segments differ by motivation and buying context, not just demographics?
- Test: describe each segment's core pain in one sentence. If two sentences sound similar, the segments aren't distinct enough. Merge or re-differentiate.
- FAIL if: two or more segments would get similar copy.

**Criterion 2: Quote Accuracy**
- Spot-check 3 quotes per segment against the source data (Review Analysis sheet, Reddit & Forums sheet, VOC Dictionary).
- Are quotes verbatim? Correctly attributed? Not paraphrased or invented?
- FAIL if: any quote is paraphrased, misattributed, or cannot be found in the source.

**Criterion 3: 9-Point Completeness**
- Every ICP has all 9 points filled with substantive entries (not "N/A" or single-sentence placeholders).
- Each point includes verbatim VOC quotes with source attribution.
- FAIL if: any point is thin (single sentence with no VOC), empty, or marked N/A without explanation.

**Criterion 4: Awareness Distribution**
- Do the awareness level percentages per persona add up logically (~100%)?
- Is the distribution grounded in actual data (ad performance, funnel stages, research findings) or guessed?
- FAIL if: percentages are clearly made up (all segments have identical 20/20/20/20/20 splits) or don't sum logically.

**Criterion 5: Persona Believability**
- Read each humanized persona. Can you describe their morning? Their 3 AM worry? How they talk to friends about this problem?
- Does the persona feel like a real person, or a demographic bucket with a name stuck on?
- FAIL if: persona reads like "Sarah, 34, busy professional who values quality"  - that's a LinkedIn summary, not a person.

**Criterion 6: Value Equation Honesty**
- If the offer is weak (Dream Outcome < 5/10, Likelihood < 0.6, Time or Effort unreasonably high), is that finding PROMINENT?
- Is it at the TOP of the doc, not buried in a section?
- Does it specify WHICH variable is broken and WHY?
- FAIL if: weak offer is minimized, buried, or vaguely described.

### The Loop

```
ITERATION {N} of 2

1. Score each segment/ICP against all 6 criteria

2. For each failing criterion:
   → Criterion 1 fail: re-examine research data for different motivational splits. If data supports it, re-segment. If not, merge similar segments and document why.
   → Criterion 2 fail: find the correct source quote and fix the attribution. If quote doesn't exist in sources, replace with a real one.
   → Criterion 3 fail: pull additional data from source sheets to fill thin points. If source data doesn't exist for this point, mark certainty as LOW and explain.
   → Criterion 4 fail: re-derive percentages from available data (ad performance tiers, funnel stage distribution, review sentiment ratios). Document the reasoning.
   → Criterion 5 fail: add specific behavioral details from Organic Intelligence, Reddit quotes, review stories. Give the persona a real morning, a real frustration, a real phrase they'd text a friend.
   → Criterion 6 fail: move weak-offer finding to top of doc with specific variable breakdown.

3. Re-score after fixes

4. After all criteria processed:
   → If all pass: EXIT LOOP, report complete
   → If iteration < 2 and criteria still failing: LOOP AGAIN
   → If iteration = 2 and criteria still failing: EXIT with escalation report
```

### Escalation Report

```
=== BLUEPRINT REVIEW COMPLETE ===

Iterations run: {1-2}

FINAL STATE:
  All criteria pass: {YES / NO}

  If NO  - escalation list:
    - Criterion {N} ({name}): STILL FAILING
      Root cause: {UPSTREAM DATA INSUFFICIENT / POOR SYNTHESIS}
      What I tried: {summary of fixes attempted}
      If upstream: "The research delivered thin data on {topic}. Gathering more customer input on that topic  - more reviews, more forum threads, more interviews  - may help."
      If synthesis: "I couldn't find a clean segmentation split. Operator input needed on: {specific question about the audience}."

Segments delivered: {count}
Confidence level: {HIGH / MEDIUM / LOW}  - based on data depth and quote availability
```

**The key distinction in escalation:** Always tell the operator WHETHER the problem is upstream (not enough data was collected) or local (the data exists but you couldn't synthesize it well). These require completely different actions  - re-running customer-intelligence vs. providing operator insight about the audience.

---

## Error Handling

- If a segment lacks sufficient VOC data for all 9 ICP points, flag which points are thin and note the certainty level.
- If research data only supports 2 segments instead of 3, document why and proceed  - don't invent segments without evidence.
- If the Value Equation reveals a broken offer, flag prominently at the top of the doc. Do not bury this finding.
- Log all issues in a running issue list. Print at the end.

---

## 2026-06 Update: Psychographic Segments by Default

For paid brand engagements, segments must be **psychographic (universal across the brand's portfolio)**, not bound to specific products or indications.

### Why

If we build segments scoped to specific products, the package becomes "research for product X + Y" instead of "research for the brand." The brand paid for the latter. One engagement required a full scope reframe across 9 docs because segments were initially scoped to two product categories; the brand pointed out the research was commissioned as audience research for the whole brand.

### How

- **Segment names are motivation-based**, not indication-based.
  - Good: "De uitgeputte aanhoudende vechter", "De beschaamde stille", "De gefrustreerde toegang-zoeker", "De sceptische controleur"
  - Bad: "De Afvallen-zoeker", "De ED-patiënt"
- The same segment shape applies wherever someone has the underlying motivation. *"De beschaamde stille"* shows up for ED, for haaruitval, for STIs, for dermatologie. Same architecture, different surface vocabulary.
- The deepest-researched products (often 1–2) become **anchor examples** that illustrate each segment with the most evidence. They are not the scope.
- Each segment must include a paragraph: "**Toepasbaarheid op het hele [brand] portfolio**" — how the segment shows up in adjacent indications the brand offers. This is the bridge for their AI to write copy for any future indication.

### Where this lands downstream

- The Blueprint doc has a "**Markt-validatie van de N segmenten**" section showing the segment holds across the brand's served markets (when multi-market research)
- The AI Context Pack `02_AUDIENCE.md` carries the universal framing forward
- The Brief intro and one-pager hero say "voor heel [brand]", not "voor product X + Y"
- The strategic anchors apply to the brand, not to specific SKUs

The principle generalises: frame the work as the whole deliverable, not the slice you researched deepest.

---

*Part of the Creative Research Bundle by [Sprints & Sneakers](https://sprintsandsneakers.com).*
