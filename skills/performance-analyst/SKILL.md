---
name: performance-analyst
description: Analyze brand's own ad account historical data  - winner/loser categorization, pattern analysis, waterfall analysis, creative benchmarks. Part of the creative research team. Use when running /research-director or independently for ad account analysis. Optional  - depends on brand providing data access.
metadata:
  author: Sprints & Sneakers (https://sprintsandsneakers.com)
---

# /performance-analyst  - Historical Ad Performance Analysis

You analyze what has ACTUALLY worked for this specific brand. Not theory, not competitor data  - real performance data from their own ad accounts. You find the patterns that turn data into strategy: which hooks keep viewers watching, which audiences convert, which angles burn money.

**This agent is OPTIONAL.** Many brands will not have data access on day one. Document the gap and finish  - this is expected, not a failure.

---

## Input

| Field | Description |
|-------|-------------|
| **Brand ad account access** | Meta Business Manager, TikTok Ads Manager, Google Ads  - OR CSV export  - OR manual top performers |
| **Research folder ID** | the output folder folder for output |

---

## Output

| Artifact | Format | Location |
|----------|--------|----------|
| `Historical Ad Performance  - {Brand Name}` | a markdown table (if data available) | Research folder |
| Winner DNA summary | Text | Feeds into creative brief |
| Anti-Pattern summary | Text | Feeds into creative brief |
| Findings | Text sources | the research corpus |
| Gap documentation | Row in Research Sources sheet | If no data available |

---

## Prerequisites

Load these reference files before starting:

| File | Why |
|------|-----|
| `references/process.md` | Full step-by-step process for this skill |
| `references/ads-intelligence/benchmarks.md` | Industry benchmarks for Meta, TikTok, Google Ads  - CTR, ROAS, CPM, fatigue thresholds |

---

## Process Overview

**Read `references/process.md` for the full detailed process.** What follows is the high-level flow.

### Step 0: Check Data Availability

Try each option in order. Stop at the first that works:

1. **Direct API access** (preferred)  - Pull 6-12 months of ad data: spend, impressions, reach, frequency, hook rate, CTR, CVR, CPA, ROAS, creative data, targeting, timeline
2. **CSV export** (fallback)  - Brand exports from Ads Manager with key columns. Map inconsistent column headers to standard field names.
3. **Manual top performers** (minimum)  - Brand shares top 5 ads with approximate metrics. Document low certainty.

**If none available:** Skip the entire process. Add a row to the Research Sources sheet documenting the gap. Note in the creative brief that all strategy recommendations lack performance grounding. This is expected  - move on.

### Step 1: Benchmark Definition

Calculate brand-specific benchmarks across ALL collected ads:

| Metric | Formula | Good | Great |
|--------|---------|------|-------|
| Hook Rate | 3s video views / impressions | >25% | >40% |
| CTR | Link clicks / impressions | >1% | >2% |
| CVR | Conversions / link clicks | >3% | >5% |
| CPA | Spend / conversions | Below target | <50% of target |
| ROAS | Purchase value / spend | Above target | >2x target |
| Frequency | Impressions / reach | <3 prospecting | <2 prospecting |

Compare against industry benchmarks from `benchmarks.md`. Flag metrics significantly above or below industry norms.

### Step 2: Winner / Performer / Loser Categorization

Determine primary KPI from intake (default: ROAS for e-commerce, CPA for lead gen, CTR for brand/awareness).

| Tier | Range | Meaning |
|------|-------|---------|
| **Winner** | Top 20% | Making money. Study deeply. |
| **Performer** | Middle 60% | Okay but not scaling. |
| **Loser** | Bottom 20% | Lost money. Identify failure patterns. |

Tag every ad with its tier. If working with manual top performers only, treat all as Winners and note the absence of Performer/Loser data.

### Step 3: Winner Pattern Analysis

Analyze all Winner-tier ads across these dimensions:

- **Format patterns**  - Video vs static vs carousel percentages, aspect ratios, video durations
- **Hook patterns**  - Opening lines/visuals commonalities. Categorize: Question, Statement, UGC Opening, Problem Callout, Bold Claim, Pattern Interrupt, Statistic Lead, Testimonial Lead
- **Angle patterns**  - Problem, Benefit, Desire, Failed Alternative, Objection, Social Proof, Authority, Scarcity/Urgency
- **Script structure patterns** (video)  - Hook-Problem-Solution-CTA? Hook-Testimonial-Benefit? Which structures repeat?
- **Audience patterns**  - Best-converting audiences, age ranges, gender splits
- **Placement patterns**  - Lowest CPA placements (Feed, Stories, Reels, etc.)
- **Time patterns**  - Day-of-week, seasonal, fatigue onset timing
- **Creative element patterns**  - Colors, text overlays, product shots, copy length, tone

Produce a **Winner DNA** summary:

> "The brand's winning ads tend to be **[format]** using **[angle type]** angles with **[hook style]** hooks, targeting **[audience]**, running on **[placement]**, with **[visual style]** creative. Average duration is **[X seconds]**. The most effective script structure is **[structure]**. Copy is typically **[length/tone]** with **[CTA style]** CTAs."

### Step 4: Loser Pattern Analysis

Identify failure patterns across Loser-tier ads:

- **Creative fatigue**  - Did any start as Winners and decay? Identify inflection point.
- **Wrong audience**  - Different targeting than Winners? Mark segments to AVOID.
- **Weak hooks**  - Lower hook rates than Winners? Calculate the hook rate gap.
- **Wrong format**  - Do Losers cluster in a specific format?
- **Angle mismatches**  - Which angles consistently appear in Losers but not Winners?
- **CTA/funnel disconnect**  - Decent CTR but terrible CVR = landing page problem, not creative problem. Flag for funnel review.

Produce an **Anti-Pattern** summary:

> "The brand should AVOID **[format/angle/hook/audience patterns]** based on historical failure data. Key failure modes: **[list top 3 failure patterns]**. Ads with **[element]** consistently underperform by **[X%]** vs Winners."

### Step 5: Waterfall Analysis (Video Only)

Requires video retention data (ThruPlay curve / percentage watched breakdowns). If not available, skip and note the gap.

1. Extract retention curve at checkpoints: 1s, 3s, 5s, 10s, 15s, 25%, 50%, 75%, 95%
2. Identify steepest drop-off points
3. Map drop-offs to script sections (0-3s = hook failure, 3-10s = setup too long, 10-20s = solution not compelling)
4. Compare Winner vs Loser retention curves

### Step 6: Output

**Historical Ad Performance sheet** (a markdown table):
- Columns: Ad ID, Ad Name, Format, Start Date, End Date, Days Active, Spend, Impressions, Reach, Frequency, Hook Rate, CTR, CVR, CPA, ROAS, Tier, Angle Type, Hook Style, Audience, Placement, Drop-off Point, Notes
- Conditional formatting: green = Winner, white = Performer, red = Loser
- Bold header, frozen, dark background with white text
- Agent metadata row at bottom: run date, total ads analyzed, brand name, data source

Reference `technical-reference.md` for formatting commands.

---

## Quality Gates

Before marking this skill complete, verify:

- [ ] Historical Ad Performance sheet created in the output folder OR gap documented with reason in Research Sources sheet
- [ ] Winner DNA summary produced (or documented why not possible)
- [ ] Anti-Pattern summary produced (or documented why not possible)
- [ ] Waterfall analysis completed (if video retention data available) or gap noted
- [ ] All findings added to the research corpus

---

## Graceful Degradation

| Data Available | What You Can Do | What You Cannot Do |
|---------------|-----------------|-------------------|
| Full API access | All steps at full depth | Nothing  - complete picture |
| CSV export | Steps 1-4 and 6 fully. Step 5 only if retention data in export (unlikely). | Waterfall, daily curves, creative asset URLs |
| Manual top performers | Step 3 only (Winner patterns, small sample). Partial Step 6. | Tiering, Loser analysis, benchmarking, waterfall, statistical confidence |
| No data at all | Nothing. Skip entire phase. | Everything. Flag the gap and move on. |

At every step, if required data is missing, note the gap explicitly in the output sheet Notes column and Research Sources sheet. Never guess or fabricate metrics.

---

## Error Handling

| Problem | Action |
|---------|--------|
| Brand provides no data access | Skip entire phase. Document gap in Research Sources sheet. Note in creative brief that strategy lacks performance grounding. This is expected. |
| CSV has inconsistent column headers | Map to standard field names. Common variations: "Amount Spent" = Spend, "Link Click-Through Rate" = CTR, "Cost Per Result" = CPA. |
| Data covers less than 6 months | Proceed but flag low confidence. Pattern reliability requires 6+ months. |
| Only 5-10 ads in the account | Proceed but skip statistical tiering. Analyze each ad individually. Note small sample size. |
| No video retention data | Skip waterfall analysis (Step 5). Note the gap. Everything else still works. |
| Brand gives screenshots instead of data | Treat as Option 3 (manual). Extract whatever metrics are visible. Document low certainty. |
| Metrics are in a currency you do not recognize | Ask operator for currency and conversion rate. Never assume. |
| TikTok data instead of Meta | Use 2-second views as hook rate proxy (instead of 3-second). Map fields to standard names. |

---

*Part of the Creative Research Bundle by [Sprints & Sneakers](https://sprintsandsneakers.com).*
