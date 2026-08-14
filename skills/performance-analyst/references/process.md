# Phase 3: Performance Intelligence  - Historical Ad Performance Analysis

This phase analyzes the brand's own historical ad performance data. It turns raw ad account data into actionable patterns: what creative elements win, what fails, and why. This is what separates strategy based on market patterns from strategy based on what actually works for THIS brand.

**This phase is OPTIONAL.** It depends entirely on brand cooperation. If the brand cannot or will not provide ad account access or data exports, skip the entire phase, flag the gap, and move on.

---

## Prerequisites

Before starting this phase, confirm the following:

1. **Ad account access**  - The brand has granted access to their ad platform(s):
   - Meta Business Manager (preferred  - richest data)
   - TikTok Ads Manager
   - Google Ads
   - Any other platform they run paid ads on

2. **OR a CSV export**  - The brand has exported their ad performance data from the relevant platform(s).

3. **OR verbal/screenshot top performers**  - The brand has shared their best-performing ads with approximate metrics.

**If none of the above are available:** Skip this entire phase. Add a row to the Research Sources sheet:
- Source Title: "Historical Ad Performance"
- Source Type: "Ad Account Data"
- Key Finding: "NO DATA  - brand did not provide ad account access or exports"
- Credibility Rating: "N/A"
- Data Points Extracted: "0"
- Relevant To Segment: "All"

Note in the creative brief (Phase 5) that all strategy recommendations lack performance grounding and are based on market/competitor patterns only.

---

## Step 5: Ad Account Historical Data Analysis

### 5a: Data Collection

Try each option in order. Stop at the first one that works.

**Option 1 (preferred): Direct API access**

Pull the following from the ad platform, however the operator can reach it: a manual export from Ads Manager, the platform API, or any automation layer they already have wired up.

- **Time range:** All ads from the last 6-12 months (minimum 6 months for pattern reliability)
- **Per-ad metrics:** Spend, Impressions, Reach, Frequency, 3-Second Video Views, ThruPlays, Link Clicks, Landing Page Views, Conversions (Purchase/Lead depending on brand objective), Purchase Value
- **Per-ad creative data:** Ad Name, Ad ID, Format (Video/Image/Carousel), Thumbnail URL, Video URL, Ad Copy (body text), Headline, CTA button type
- **Per-ad targeting:** Audience Name, Age Range, Gender Split, Placement (Feed/Stories/Reels/Audience Network)
- **Per-ad timeline:** Start Date, End Date, Daily spend curve (for fatigue analysis)

For TikTok Ads Manager and Google Ads: pull equivalent fields where available. TikTok provides 2-second and 6-second view metrics instead of 3-second views  - use 2-second views as the hook rate proxy.

**Option 2 (fallback): CSV import**

Ask the brand to export from Ads Manager with these columns at minimum:
- Ad Name, Ad ID, Delivery Status, Start Date, End Date
- Amount Spent, Impressions, Reach, Frequency
- Link Clicks, CTR (Link Click-Through Rate), Results, Cost Per Result, ROAS

Read the CSV and parse into structured data. Map column names to the standard field names above  - platform exports use inconsistent headers.

**Option 3 (minimum): Manual top performers**

Ask the brand: "What are your top 5 best-performing ads of all time? Share screenshots or links and their approximate metrics (spend, results, ROAS or CPA)."

Analyze whatever the brand provides. Document that findings are based on a small, self-reported sample  - certainty level is Low for all outputs from this option.

---

### 5b: Benchmark Definition

Calculate brand-specific benchmarks across ALL collected ads. These are the brand's OWN averages  - not industry benchmarks.

| Metric | Formula | Good | Great |
|--------|---------|------|-------|
| **Hook Rate** | 3-second video views / impressions (video only) | >25% | >40% |
| **CTR** | Link clicks / impressions | >1% | >2% |
| **CVR** | Conversions / link clicks | >3% | >5% |
| **CPA** | Spend / conversions | Below brand's target CPA (from intake) | <50% of target CPA |
| **ROAS** | Purchase value / spend | Above brand's target ROAS (from intake) | >2x target ROAS |
| **Frequency** | Impressions / reach | <3 (prospecting) / <8 (retargeting) | <2 / <5 |

Compare brand benchmarks against industry benchmarks from `references/ads-intelligence/benchmarks.md`:

- **Meta Ads:** CTR baseline 1.71% (traffic) / 2.59% (leads). ROAS baseline 2.19:1 (all industries) / 4.52:1 (Advantage+ Sales). CPM varies by industry  - check the CPM by Industry table.
- **TikTok Ads:** CTR baseline ~0.84%. CVR baseline ~0.46%. CPM baseline ~$4.26.
- **Google Ads:** CTR baseline 6.66% (search). CVR baseline 7.52% (search). CPC baseline $5.26.
- **Creative fatigue thresholds:** Frequency >3 (warning) / >5 (fail) for prospecting. CTR decline >20% over 14 days = fatigue. TOF creative lifespan ~3-4 weeks. BOF creative lifespan ~6-7 weeks.

Flag any brand metrics that are:
- **Significantly above industry norm**  - Identify what's driving outperformance. These are strengths to double down on.
- **Significantly below industry norm**  - Identify the bottleneck. These are problems to solve in the new strategy.

---

### 5c: Winner / Performer / Loser Categorization

Determine the brand's primary KPI. Check the intake form. If unclear, default to:
- E-commerce brands: ROAS
- Lead gen brands: CPA (lower is better)
- Brand/awareness brands: CTR

Sort all ads by the primary KPI. Categorize:

| Tier | Range | What it means |
|------|-------|---------------|
| **Winner** | Top 20% by primary KPI | These ads are making money. Study them deeply. |
| **Performer** | Middle 60% | Okay but not scaling. Identify what separates them from Winners. |
| **Loser** | Bottom 20% | Lost money or underperformed badly. Identify failure patterns. |

Tag every ad with its tier in the Historical Ad Performance sheet.

If working with Option 3 data (manual top performers only), skip tiering  - treat all provided ads as Winners and note the absence of Performer/Loser data as a gap.

---

### 5d: Winner Pattern Analysis

For all ads in the Winner tier, identify recurring elements across these dimensions:

**Format patterns**
- What percentage are video vs static vs carousel?
- What aspect ratios dominate (1:1, 4:5, 9:16)?
- What video durations perform best?

**Hook patterns**
- What do the opening lines or visuals have in common?
- Categorize each hook: Question Hook, Statement Hook, UGC Opening, Problem Callout, Bold Claim, Pattern Interrupt, Statistic Lead, Testimonial Lead
- Which hook types appear most frequently in Winners?

**Angle patterns**
- Classify each Winner by angle type: Problem, Benefit, Desire, Failed Alternative, Objection, Social Proof, Authority, Scarcity/Urgency
- Which angle types appear most in Winners vs least in Losers?

**Script structure patterns (video ads)**
- Map each winning video's structure: Hook-Problem-Solution-CTA? Hook-Testimonial-Benefit? Hook-Demo-Offer? Hook-Story-Reveal?
- Which structures repeat?

**Audience patterns**
- Which audiences convert best? Note age ranges, gender splits, interest targeting.
- Which audiences appear in Winners but not in Losers?

**Placement patterns**
- Which placements drive lowest CPA? Feed, Stories, Reels, Audience Network, Search, Explore?
- Are Winners concentrated on specific placements?

**Time patterns**
- Do Winners perform better on certain days of the week?
- Are there seasonal patterns (Q4 holiday, summer lull, etc.)?
- How long do Winners stay profitable before fatigue sets in?

**Creative element patterns**
- Common visual elements: colors, text overlays, product shots, lifestyle imagery, UGC style, studio quality?
- Common copy structures: short vs long copy, emoji usage, line breaks, CTA phrasing?
- Common tone: casual, professional, urgent, educational, entertaining?

Produce a **Winner DNA** summary in this format:

> "The brand's winning ads tend to be **[format]** using **[angle type]** angles with **[hook style]** hooks, targeting **[audience]**, running on **[placement]**, with **[visual style]** creative. Average duration is **[X seconds]**. The most effective script structure is **[structure]**. Copy is typically **[length/tone]** with **[CTA style]** CTAs."

---

### 5e: Loser Pattern Analysis

For all ads in the Loser tier, identify failure patterns:

**Creative fatigue**
- Did any Losers start as Winners and decay over time?
- If daily data is available, plot the performance curve. Identify the inflection point: after how many impressions or days did performance decline?
- Cross-reference with the creative fatigue thresholds from benchmarks: frequency >3 for prospecting, >5 for fail, CTR decline >20% over 14 days.

**Wrong audience**
- Were Losers targeting a different audience than Winners?
- Identify which audience segments to AVOID in the new strategy.

**Weak hooks**
- Do Losers have lower hook rates than Winners? If yes, the hook is the primary failure point  - prioritize hook variation in the new strategy.
- Calculate the hook rate gap: Winner avg hook rate minus Loser avg hook rate.

**Wrong format**
- Do Losers cluster in a specific format? (e.g., all static ads are Losers but video ads are Winners)
- If so, deprioritize that format in new creative production.

**Angle mismatches**
- Which angle types consistently appear in Losers but not Winners?
- These angles should be deprioritized or reworked with different execution.

**CTA / funnel disconnect**
- Do any Losers have decent CTR (>1%) but terrible CVR (<1%)?
- This means the ad works but the landing page or checkout flow doesn't. Flag for funnel review  - the problem is downstream, not in the creative.

Produce an **Anti-Pattern** summary in this format:

> "The brand should AVOID **[format/angle/hook/audience patterns]** based on historical failure data. Key failure modes: **[list top 3 failure patterns]**. Ads with **[element]** consistently underperform by **[X%]** vs Winners."

---

### 5f: Waterfall Analysis (Video Ads Only)

This sub-step requires video retention data from Meta (ThruPlay curve / percentage watched breakdowns). If retention data is not available, skip this sub-step entirely and note the gap in the output sheet.

For each video ad with retention data:

1. **Extract the retention curve**  - Record the percentage of viewers still watching at these checkpoints:
   - 1 second, 3 seconds, 5 seconds, 10 seconds, 15 seconds
   - 25% of video length, 50%, 75%, 95%

2. **Identify the steepest drop-off points**  - Where does the curve fall fastest? This is where the ad loses people.

3. **Map drop-off to script sections**  - Correlate each timestamp with the corresponding part of the ad's script or visual sequence. Common patterns:

   | Drop-off window | Likely cause | Fix direction |
   |----------------|--------------|---------------|
   | 0-3 seconds | Hook failure  - opening didn't stop the scroll | Test stronger hooks, pattern interrupts, faster opening |
   | 3-10 seconds | Problem/context section too long or not relatable | Shorten setup, make problem more visceral |
   | 10-20 seconds | Solution not compelling or poorly timed CTA | Restructure: move proof/demo earlier, delay or advance CTA |
   | 75%+ retention | Strong ad  - study what keeps viewers watching | Replicate this structure and pacing |

4. **Compare Winner vs Loser retention curves**  - Do Winners maintain higher retention throughout, or do they just hook better in the first 3 seconds? This tells you whether the problem is hooks or middle-of-ad content.

---

### 5g: Output

Create the following output artifacts:

**Historical Ad Performance sheet** (a markdown table in Research/ folder)

Title: `Historical Ad Performance  - {Brand Name}`

Columns (match the spec in `technical-reference.md`):
- Ad ID, Ad Name, Format, Start Date, End Date, Days Active, Spend, Impressions, Reach, Frequency, Hook Rate, CTR, CVR, CPA, ROAS, Tier (Winner/Performer/Loser), Angle Type, Hook Style, Audience, Placement, Drop-off Point (video), Notes

Formatting:
- Apply conditional formatting by Tier column: green background for Winner rows, white for Performer rows, red for Loser rows
- Bold the header row, freeze it, dark background with white text (per `technical-reference.md` formatting standards)
- Auto-resize all columns
- Add an agent metadata row at the bottom: run date, total ads analyzed, brand name, data source (API/CSV/Manual)


**Research Sources sheet**  - Add a row for each data source used:
- Source Title: "Meta Ad Account  - {Brand Name}" (or TikTok/Google as applicable)
- Source Type: "Ad Account Data"
- Key Finding: The single most important insight (e.g., "UGC video ads outperform studio content by 3.2x ROAS")
- Credibility Rating: "High" (first-party data)
- Data Points Extracted: Total number of ads analyzed

**Creative Brief (Phase 5)**  - Feed these into the brief:
- Winner DNA summary goes into the "Historical Performance" section
- Anti-Pattern summary goes into the "What to Avoid" section
- Brand-specific benchmarks go into the "Success Metrics" section

**Angle Bank (Phase 4)**  - Feed Winner patterns into angle confidence ratings:
- Angles aligned with historical Winner patterns get a certainty boost (move up one level: Low → Medium, Medium → High)
- Angles similar to historical Loser patterns get flagged with a note: "CAUTION: Similar angles underperformed historically"
- Angles with no historical data remain at their research-based certainty level

---

## Graceful Degradation Summary

| Data available | What you can do | What you cannot do |
|---------------|-----------------|-------------------|
| Full API access (Option 1) | All sub-steps (5a-5g) at full depth | Nothing  - this is the complete picture |
| CSV export (Option 2) | 5a-5e and 5g fully. 5f only if retention data is in the export (unlikely). | Waterfall analysis, daily performance curves, creative asset URLs |
| Manual top performers (Option 3) | 5d (Winner patterns only, small sample). Partial 5g. | Tiering, Loser analysis, benchmarking, waterfall, statistical confidence |
| No data at all | Nothing. Skip entire phase. | Everything. Flag the gap and move on. |

At every sub-step, if the required data is missing, note the gap explicitly in the output sheet's Notes column and in the Research Sources sheet. Do not guess or fabricate metrics.
