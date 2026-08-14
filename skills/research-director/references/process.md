# Phase 5: Output & Delivery

This phase compiles all research into the final deliverables.

**Prerequisites:** Phase 4 (Synthesis & Blueprint) must be complete with output validation passed.


**CRITICAL: Every a markdown file MUST go through the mandatory two-pass formatting process described in technical-reference.md. Insert all text first, then run the Format Pass to apply TITLE, HEADING_1, HEADING_2, HEADING_3 styles. Verify formatting before proceeding. A plain-text Doc with zero headings is NOT acceptable output.**

---

## Step 11: Compile Creative Brief

**Load now:** `references/copywriting-knowledge/02-hooks-and-headlines.md` + `references/copywriting-knowledge/05-copy-quality-and-style.md` (for writing copy lines) AND `references/copywriting-knowledge/06-static-and-visual-formats.md` (for visual direction, format selection by awareness level)

The Creative Brief is the final deliverable that feeds all creative production. Create it as `Creative Brief  - {Brand Name}` (a markdown file in Research/ folder).

### Creative Brief Structure (17 Sections):

**1. Critical Warning** (if applicable)
- If the Value Equation reveals a broken offer, positioning issues, or reputation problems  - this goes FIRST. Never skip it. Include specific recommendations.

**2. Brand Overview**
- Brand name, product, market, positioning summary
- Brand assets (colors, fonts, logo, product images)
- Key differentiators (from customer language, NOT marketing speak)

**3. Audience Segments** (from Phase 4, Step 8a)
- Segment name, size estimate, priority level
- Per segment: core characteristics, primary pain/desire/trigger

**4. ICPs / Personas** (from Phase 4, Steps 8b-8d)
- Per persona: name, humanized profile, all 9 attributes
- Awareness level mapping with hook direction per level
- Top 3 VOC quotes per persona

**5. VOC Dictionary** (from Phase 4, Step 7c)
- Full dictionary: power phrases, pain language, desire language, objection language, recommendation language, words they use, words they never use, competitor-specific language

**6. Competitive Landscape** (from Phase 2, Step 4g)
- Strategy profiles per competitor (tagged by type: direct/indirect/audience)
- Top competitor ads (with images if available)
- What competitors do well vs. poorly

**7. Competitive Messaging Gap Matrix** (from Phase 4, Step 7d)
- Full gap matrix: customer need vs. competitor messaging vs. the gap
- Top 5-8 opportunities ranked by size
- Gaps tagged by competitor type

**8. Angle & Concept Bank** (from Phase 4, Steps 9-10)
- Every angle with evidence trails and confidence ratings
- 40/40/20 allocation marked
- Organized by segment and awareness level
- Performance alignment notes (if data available)

**9. Copy Line Bank** (research deliverable  - VOC-based raw materials)
- Pre-written headlines per angle (using VOC language)
- Pre-written body copy per angle
- CTA variations per awareness level

**10. Visual Landscape** (what exists in the market)
- Brand assets (colors, fonts, logo, imagery)
- Competitor visual styles observed
- Reference images from competitor analysis (categorized, not recommended)

**11. Platform Specs & Dimensions**
- Dimensions from Step 0 intake
- Platform-specific requirements (read `references/ads-intelligence/platform-specs.md`)

**12. Positioning & Offer Assessment** (from Phase 4, Step 8e  - DIAGNOSIS ONLY)
- Value Equation score and breakdown
- If weak, FLAG with specific issues
- Do NOT include strategic recommendations  - those go to the strategy agent

**13. Creative Provocation Layer** (from Phase 4, Step 7b)
- Contrarian findings, whitespace map, cross-industry inspiration
- "What If" provocations (5-10 speculative hypotheses)
- ALL tagged as Certainty: Speculative

**14. Organic Content Intelligence** (from Phase 1, Step 3c + Phase 2, Step 4b)  - NEW
- Top-performing organic content themes and formats
- Customer language from organic comments (key quotes)
- Engagement patterns (what drives comments vs shares vs likes)
- If no organic data: note the gap and what it means for paid strategy

**15. Performance Intelligence** (from Phase 3)  - NEW
- Winner DNA summary (what winning ads have in common)
- Anti-Pattern summary (what to avoid based on historical losers)
- Key benchmarks (hook rate, CTR, CVR, CPA, ROAS) vs industry
- Creative fatigue patterns (if identified)
- If no performance data: note the gap

**16. Scope & Channel Brief** (from Step 0 intake  - passed to strategy agent)
- Channels, monthly budget, funnel stages, formats, primary goal, dimensions

**17. Sources & Data Locations**
- the output folder folder links for all outputs
- Local file paths for raw data
- A pointer to the research corpus
- External research source URLs with credibility ratings

### Formatting:
- HEADING_1 for document title: "Creative Brief  - {Brand Name}"
- HEADING_2 for each of the 17 sections
- HEADING_3 for subsections (individual personas, segments, etc.)
- Bold all field labels and section introductions
- Italics for all verbatim customer quotes
- Tables for structured data (gap matrix summary, awareness mapping, persona overview)
- Clear spacing between sections
- Agent metadata footer: run date, certainty summary, data sources count, phases completed

Also save as markdown at `brands/{brand-slug}/01-research/creative-brief.md`.

---

## Step 12: Audio Briefing (optional)

Skip unless the operator has a tool that generates it. Nothing downstream depends on it.

An eight-page brief gets skimmed. A ten to fifteen minute audio version gets absorbed on a commute.
If more than one person will work on this brand, it is the cheapest way to get everyone holding
the same picture of the customer.

If you can produce one, cover:
- Who the brand is and what they sell
- The audience segments, and what actually drives each one
- The findings that genuinely surprised you, including the VOC quotes worth repeating
- Competitive gaps and how this brand could take them
- The strongest angles and the reasoning behind each
- Performance patterns, if any history exists
- Any warning or strategic flag the brief carries

Note it in the brief and in the source list so nobody rebuilds it later.

## Step 13: Email Notification & Handoff

### 13a: Ask for Email Recipients

Ask the operator: **"Research is complete. Which email addresses should I notify?"**

Wait for response. Do NOT proceed without email addresses.

### 13b: Send Notification

**Subject:** `Creative Research Complete  - {Brand Name}`

**Body:**
```
Creative Research for {Brand Name} is complete.

DELIVERABLES:
• Creative Brief (17 sections)  - [the output folder link]
• 20-30 Evidence-Linked Angles  - [the output folder link to Angle Bank]
• VOC Dictionary  - [the output folder link]
• Competitive Gap Matrix  - [the output folder link]
• Audio Briefing (10-15 min)  - if generated
• The full research corpus, queryable
• All files in the output folder folder: [link to brand folder]

KEY FINDINGS:
• {Top 3 bullet points  - most important/surprising insights}

PERFORMANCE CONTEXT:
• {Winner patterns or "No historical ad data available"}

WARNINGS:
• {Critical flags or "None"}

Next step: review the brief, then hand it to the Creative Copywriting Bundle and run /creative-strategy there.
```

Use Slack MCP if configured, or ask operator to forward.

### 13c: Print Final Summary

```
=== CREATIVE RESEARCH COMPLETE ===

Brand: {name}
Duration: {time from Step 0 to Step 13}

Research completed:
├── Website & brand assets extracted
├── {X} Trustpilot reviews analyzed (brand + {Y} competitors)
├── {Z} Reddit posts analyzed across {W} subreddits
├── LLM Element Research: {N} findings across 8 categories
├── {M} competitor ads scraped ({D} direct, {I} indirect, {A} audience competitors)
├── {P} winning ads deep-analyzed
├── Brand organic content: {Q} posts analyzed, {R} comments mined
├── Historical ad performance: {S} ads categorized (or "Skipped  - no access")
├── {T} external research sources imported
├── Cross-source synthesis complete (7 source types)
├── {U} angles/concepts generated and stress-tested
├── Audio briefing (if generated)
└── Team notified via {channel}

the output folder files created:
├── Creative Brief (a markdown file)  - 17 sections
├── Angle Bank (a markdown table)  - {count} angles
├── VOC Dictionary (a markdown file)  - 8 categories
├── Competitive Gap Matrix (a markdown table)  - {count} gaps
├── Review Analysis (a markdown table)  - {count} findings
├── Reddit Research (a markdown table)  - {count} findings
├── LLM Element Research (a markdown table)  - {count} findings
├── Competitor Ads (a markdown table)  - {count} ads
├── Organic Intelligence (a markdown file)  - themes + quotes
├── Organic Metrics (a markdown table)  - {count} posts
├── Historical Ad Performance (a markdown table)  - {count} ads (or "N/A")
├── Research Sources (a markdown table)  - {count} sources
├── Audience Segments (a markdown file)  - {count} segments + {count} personas
└── Brand folder: [the output folder link]

Top 3 gaps discovered:
1. {gap}
2. {gap}
3. {gap}

Warnings: {flags or "None"}
===================================
```
