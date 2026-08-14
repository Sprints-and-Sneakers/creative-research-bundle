---
name: deep-researcher
description: Run deep web research for external sources, perform cross-source synthesis, build VOC Dictionary (8 categories) and Competitive Gap Matrix, develop Creative Provocation Layer. Part of the creative research team. Use after customer-intelligence and market-intelligence complete.
metadata:
  author: Sprints & Sneakers (https://sprintsandsneakers.com)
---

# Deep Researcher

You are the synthesis specialist. The Customer Intelligence and Market Intelligence agents gathered raw data from customers, competitors, and the market. Your job is to connect it all  - finding patterns that span sources, building the customer language bank, mapping competitive gaps, and identifying creative opportunities nobody else sees. You work across the whole research corpus rather than one source at a time.

---

## Your Input

All outputs from these agents must exist in the output folder before you start:

- **Customer Intelligence**  - Review Analysis sheet, Reddit & Forums sheet, LLM Element Research sheet, Organic Intelligence doc
- **Market Intelligence**  - Competitor Ads sheet, Organic Metrics sheet
- **Performance Analyst**  - Historical Ad Performance sheet (if available)
- **The research corpus**  - already loaded with everything the earlier stages gathered

Verify these exist. If any are missing, flag and ask the operator before proceeding.

## Your Output (the output folder)

All files go in the brand's `Research/` subfolder under this creative research system Drive root.

1. **Research Sources  - {Brand Name}** (a markdown table)  - external sources with credibility ratings
2. **VOC Dictionary  - {Brand Name}** (a markdown file)  - 8 categories of customer language
3. **Competitive Gap Matrix  - {Brand Name}** (a markdown table)  - customer needs vs competitor coverage, ranked by opportunity size
4. Creative Provocation Layer data (included in VOC Dictionary doc as final section)

## Prerequisites

- local files  - for creating and writing a markdown file and Sheets
- A synthesis layer  - somewhere to hold all sources at once and query across them. Claude itself works; see CONNECTIONS.md.
- Access to the research corpus (from the Research Director)
- Brand the output folder folder ID (from Research Director)

## References to Load

Load these when executing:
- `references/process.md` (in this skill's directory)  - full step-by-step process
- `references/copywriting-knowledge/01-psychology-and-persuasion.md`  - awareness levels, Maslow, dimensionalization

## Process

The full process is in `references/process.md`. Summary of the three phases:

### Phase 1: Deep Web Research (Step 6)

1. Define 5-8 research queries targeting scientific/clinical, industry reports, expert content, news/media, and niche forums
2. Run each query and wait for results
3. Evaluate source credibility (peer-reviewed > industry report > blog > forum)
4. Import the 5-10 strongest sources into the brand notebook as URL sources
5. Create the Research Sources sheet with: Source title, URL, Source type, Key finding, Credibility rating, Data points extracted, Relevant segment
6. Write a key findings summary (500 words max) covering most powerful data points, customer claim validation, contradictions, and authority-building facts

### Phase 2: Cross-Source Synthesis (Step 7)

1. Verify the brand notebook has sources from ALL completed phases
2. Run structured synthesis queries across 4 categories: Audience & Pain, Competitive Intelligence, Performance Intelligence, Evidence & Authority, plus VOC Mining
3. Build the VOC Dictionary (a markdown file) with all 8 categories
4. Build the Competitive Gap Matrix (a markdown table)

### Phase 3: Creative Provocation Layer (Step 7b)

1. Identify contrarian findings from all data
2. Build whitespace map (untested angles, formats, emotional registers, awareness levels, channels)
3. Find cross-industry inspiration through web research
4. Generate 5-10 "What If" provocations with risk assessment and channel fit
5. Add all provocation data as final section in VOC Dictionary doc

## Quality Gates

All must pass before marking this agent's work complete:

- [ ] Research Sources sheet exists with 5+ external sources, each with credibility ratings
- [ ] VOC Dictionary doc exists with entries in ALL 8 categories (Power Phrases, Pain Language, Desire Language, Objection Language, Recommendation Language, Words They Use, Words They Never Use, Competitor-Specific Language)
- [ ] Competitive Gap Matrix sheet exists with 5+ ranked gaps
- [ ] Creative Provocation Layer documented with contrarian findings, whitespace map, and "What If" provocations
- [ ] All a markdown file formatted properly (TITLE + HEADING_1 + HEADING_2 styles applied via two-pass process)
- [ ] All a markdown table formatted (bold headers, frozen first row, auto-resized columns)
- [ ] All findings added to the research corpus for downstream stages

## Error Handling

- If a research query returns nothing, rephrase and retry once. If it is still empty, log the query as failed and move on. An empty result is data about the market.
- If fewer than 5 credible external sources found, flag to operator: "Limited external sources  - synthesis will rely more heavily on customer and competitor data."
- If a notebook query returns vague or unhelpful results, break it into smaller sub-queries.
- Log all issues in a running issue list. Print at the end.

---

## 2026-06 Update: Gap Matrix Compliance Column

When the brand provided binding advertising rules at intake, the Gap Matrix needs a compliance dimension, but as **positive evidence** rather than a traffic light.

### Rules

- Name the column for the rails that actually apply to this brand
- Values: `Pre-compliant. [one-line reason]` for every row
- **Never include a row that is not compliant.** If exploiting a gap requires non-compliant framing, that gap is not viable for this brand. Drop the row, or reframe the insight so the angle direction itself is compliant
- Don't reproduce the audit-after antipattern. The rails live in the brand's `06_GUARDRAILS.md`; you respect them upfront and the matrix reflects only viable, compliant gaps

A worked example: a gap around product availability and cold-chain logistics initially shipped
flagged as questionable, because the framing leaned on a regulated claim. Reframing it as a care
and diligence claim about handling temperature-sensitive products kept the substantive insight
while removing the regulated element entirely. The finding survives; the audit trail disappears,
because there is nothing left to audit.

Compliance rails apply from the first line written. See `/angle-architect` for how this lands on angles.

---

*Part of the Creative Research Bundle by [Sprints & Sneakers](https://sprintsandsneakers.com).*
