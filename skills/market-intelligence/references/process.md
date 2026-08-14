# Phase 2: Market Intelligence

This is a phase reference doc for the Creative Research Agent. It covers competitor ad analysis and brand organic content analysis. The agent loads this file at runtime when executing Phase 2.

**Load now:** `references/copywriting-knowledge/03-script-elements-and-modules.md` (25 persuasion elements, 8 modules  - needed to classify competitor ad structures) AND `references/copywriting-knowledge/06-static-and-visual-formats.md` (static ad formats, design principles, visual hierarchy  - needed for visual analysis) AND `references/copywriting-knowledge/01-psychology-and-persuasion.md` (awareness levels  - needed to classify which funnel stage each ad targets)

## Web Research as a Parallel Competitor Engine

While you pull structured ad data from the Ad Library, run web research in parallel for the competitor intelligence the Ad Library never shows:


This catches:
- Competitor press coverage, case studies, and marketing blog posts
- Industry reports on ad trends and creative benchmarks
- Competitor organic social strategies documented in articles
- Third-party analyses of competitor advertising

Add the best findings to the brand notebook:

---

## Competitor Classification System

Before analyzing any competitor, classify every competitor from the intake (Q5) into one of three types. This classification determines analysis depth for every step that follows. Tag every competitor and every ad with its type throughout the entire phase.

### Type 1: Direct Competitors (5 total)

Selling the same type of solution for the same problem.

- Example: Mushroom coffee brand → other mushroom coffee brands
- Example: Kitchen renovation company → other kitchen renovation companies
- Analysis depth: **FULL**  - ad scraping + deep visual/copy analysis + strategy profiles + gap analysis

### Type 2: Indirect / Solution Competitors (3 total)

Selling a different solution for the same problem.

- Example: Mushroom coffee brand → regular coffee brands, energy supplement brands
- Example: Kitchen renovation company → DIY kitchen brands, kitchen painting services
- Analysis depth: **MESSAGING-ONLY**  - scrape ads, analyze copy/angles/hooks, skip visual deep-dive

### Type 3: Audience Competitors (3 total)

Selling to the same audience but in a different product category.

- Example: Mushroom coffee brand → meditation apps, wellness supplements, productivity tools targeting health-conscious professionals
- Example: Kitchen renovation company → interior design platforms, home improvement influencers, mortgage/home equity lenders
- Analysis depth: **AUDIENCE-OVERLAP**  - what creative approaches resonate with this shared audience? What hooks, tones, and emotional registers work? Skip product-specific analysis

**Total: every competitor in the reconciled set analyzed.**

If the intake provides fewer than 11, use WebSearch to identify additional competitors to fill each category. If the intake provides more, prioritize by market presence and relevance. Always confirm the final list with the operator before scraping.

Tag format in all output: `[DIRECT]`, `[INDIRECT]`, `[AUDIENCE]`.

---

## Step 4: Competitor Ad Intelligence

**CRITICAL: This step scrapes COMPETITOR ads ONLY. NEVER scrape the brand's own ads. The brand is NOT a competitor. Only scrape the companies classified above. If you are unsure whether a brand is a competitor or the brand, ask the operator.**

**Why this step matters:** Competitor ads are the market's report card. Ads that have been running for months with high spend are PROVEN winners  - the market has voted with real money. By reverse-engineering what works for competitors, avoid reinventing the wheel and focus the brand's budget on gaps and opportunities nobody else is exploiting.

---

### 4a: Find Competitor Facebook Pages

Run this for every competitor in the reconciled set, in parallel where the environment supports it.

For each competitor, find their exact Facebook Page and extract their Ad Library Page ID. Getting the wrong page = scraping the wrong ads = useless data.

**Step 1: Check existing data first.**
Check the brand's **Competitor Ads** a markdown table (if it exists from a previous run). Look for the competitor name. If found, check for a stored `Facebook Page ID` or `Ad Library Page ID` column. If it exists and is populated, skip to 4b for that competitor. Also check local files at `brands/{brand-slug}/01-research/competitor-ads/`.

**Step 2: Find the Facebook Page URL.**
If no stored data exists, find the competitor's Facebook page. Use WebSearch:
- `"{competitor name}" site:facebook.com`
- `"{competitor name}" facebook page`
- Check the competitor's website footer/header  - most brands link to their Facebook page

**Validate you have the RIGHT page:**
- The page name must match the competitor's brand name
- Check the page's "About" section  - it must match the competitor's industry/product
- Check follower count  - a real brand page typically has 1K+ followers
- If multiple pages exist (e.g., regional pages, old pages), pick the one that is actively posting and matches the market the brand operates in

**Step 3: Extract the Ad Library Page ID.**
Find the official Ad Library page ID:

**Gather the reviews.**

Pull as many as the source publicly holds. More data means more accurate output; a thin
pool is itself a finding worth documenting.

See `CONNECTIONS.md` → *Review data* for every way to do this: an automated scraper, a
platform export, or reading pages directly with web access. The method below does not
care which one you used.

From the response, extract **`pageAdLibrary.id`** (NOT `pageId`). The `pageAdLibrary.id` is the one Meta uses in the Ad Library URL. Store it.

**If the scraper fails or returns no `pageAdLibrary.id`:**
1. Try the direct Ad Library URL manually: `https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country=NL&q={competitor+name}&search_type=keyword_unordered`
2. Use WebSearch: `"{competitor name}" facebook ad library`
3. If still nothing  - the competitor might not be running Meta ads. Report this to the operator and skip this competitor for ad scraping. This is still valuable intel: "Competitor X has no active Meta ads" tells you they are either not on Meta or using a different page name.

**Step 4: Verify with a quick Ad Library check.**
Before running the full scrape, verify the page ID actually has ads. Use WebFetch on:
`https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country={PARTNER_COUNTRY}&view_all_page_id={AD_LIBRARY_PAGE_ID}`

If the page shows no active ads or looks wrong, stop and debug before wasting the gathering tool credits.

**Store the Page ID** in the **Competitor Ads** a markdown table and locally in the competitor intelligence report. Include the competitor type tag. This is reusable data  - never look this up twice.

---

### 4b: Scrape Competitor Ads from Meta Ad Library


**Country targeting  - two-pass approach:**
1. **First pass:** Scrape with the brand's market country (e.g. `country=NL`). This shows what competitors run IN the brand's market.
2. **Second pass (if 0 results):** Re-scrape with the competitor's home market country (e.g. `country=US`, `country=AU`) or `country=ALL`. International competitor ads are HIGHLY VALUABLE  - hooks, angles, formats, and structure translate across languages. Flag these as "non-local market" in the output sheet but analyze them FULLY.

**The rule: research language doesn't matter. Output language matters.** An English Sweat ad with a killer hook format is just as useful as a Dutch competitor ad. We study the creative PATTERN, not the words. We adapt the pattern into the brand's language.

**Scrape volume per competitor type:**

| Competitor Type | `maxAds` | Rationale |
|---|---|---|
| Direct `[DIRECT]` | `50` | Full winner pool needed for deep analysis |
| Indirect `[INDIRECT]` | `30` | Messaging analysis only  - fewer ads needed |
| Audience `[AUDIENCE]` | `20` | Creative approach patterns only  - smallest sample |

**Gather every competitor in the reconciled set, in parallel where the environment supports it.**

**Gather the ads.**

Pull the currently-running and long-running ads for each competitor. Long-running ads
matter most — sustained spend is the only public signal that something is working.

See `CONNECTIONS.md` → *Competitor ad data*. Meta Ad Library and TikTok Creative Center
are free public tools and need no API access at all.

**Why sorted by `total_impressions` descending:** You get their highest-spend ads first. Top ads cover the winners and recent tests  - beyond that you are scraping dead ads and noise.

**If a competitor has MANY ads (100+),** that itself is intel  - they are investing heavily in creative testing. Note this. For DIRECT competitors with 100+ ads, increase to `maxAds: 100`.

After the run completes, fetch results:
**Gather the reviews.**

Pull as many as the source publicly holds. More data means more accurate output; a thin
pool is itself a finding worth documenting.

See `CONNECTIONS.md` → *Review data* for every way to do this: an automated scraper, a
platform export, or reading pages directly with web access. The method below does not
care which one you used.

Save raw results per competitor to `brands/{brand-slug}/01-research/competitor-ads/{competitor-slug}-ads.json`. Include the competitor type tag in the filename or as a top-level field in the JSON.

---

### 4b-2: Multi-Channel Competitor Intelligence

**Only run this sub-step if the brand's scope (Step 0, Q6) includes TikTok or YouTube.** If the brand is Meta-only, skip to 4c.

**TikTok Competitor Research:**
For each competitor, use WebSearch to find their TikTok presence:
- `"{competitor name}" site:tiktok.com`
- `"{competitor name}" TikTok`

Analyze:
- **Presence:** Do they have a TikTok account? (Absence = opportunity. If nobody in the market is on TikTok, first-mover advantage is massive.)
- **Content style:** UGC, brand-produced, creator partnerships, trend-driven?
- **Posting frequency:** Daily, weekly, occasional?
- **Top content themes:** Sort by views/engagement. What resonates?
- **TikTok ads:** Check TikTok Creative Center (`ads.tiktok.com/business/creativecenter`) if accessible. Are they running paid TikTok ads?
- **Follower count + engagement rate:** Size vs. engagement ratio

**YouTube Competitor Research:**
For each competitor, use WebSearch:
- `"{competitor name}" site:youtube.com`
- `"{competitor name}" YouTube channel`
- Check Google Ads Transparency Center: `adstransparency.google.com` for their YouTube ad activity

Analyze:
- **Presence:** YouTube channel? How active?
- **Video content:** What topics, what length, what style?
- **Most viewed videos:** What resonates with their audience?
- **YouTube Shorts:** Are they making vertical short-form content?
- **YouTube ads:** Any evidence of running YouTube ads?

Tag all findings by channel AND competitor type. The strategy agent uses this to build channel-specific competitive positioning. Store in the competitor strategy profiles alongside the Meta data.

---

### 4c: Classify & Separate Ad Formats

The scraper returns ALL ad formats mixed together. Before analysis, separate them.

| Format (from data) | Category | Analyze? |
|---|---|---|
| `image` (single image) | Static | Yes  - primary focus |
| `carousel` | Static | Yes  - carousels ARE static ads, often the highest-performing format. Do NOT filter these out |
| `video` | Video | Yes  - for messaging intelligence only (read the copy, note the angle, but skip visual breakdown) |
| `DCO` / dynamic | Dynamic | Note count only  - means competitor is running dynamic product ads (DPA). Intel, not analyzable |

**Count per competitor (include competitor type tag):**
- Total ads active
- Breakdown by format (X static, Y carousel, Z video, W dynamic)
- Competitor type: `[DIRECT]` / `[INDIRECT]` / `[AUDIENCE]`
- This ratio itself is intelligence: a competitor running 80% video = they have found video works. A competitor running 60% carousel = carousels are their workhorse.

---

### 4d: Identify Winners  - Think Like a Media Buyer

Do not analyze every ad. Find the winners first, then go deep on those.

The Meta Ad Library does not give exact spend or ROAS. But it gives proxy signals that together reveal which ads are making money.

**Signal 1: Runtime (days active)**
- Calculate `days_running` = `endDate` (or today if still active) minus `startDate`
- < 14 days = Too early to tell (could be a new test)
- 14-30 days = Showing promise (survived initial testing)
- 30-60 days = Strong signal (media buyer kept it alive through at least one review cycle)
- 60-90 days = Proven performer (consistently delivering ROI)
- 90+ days = Cash cow / evergreen winner (study this ad like your life depends on it)

**Signal 2: Impression indicators**
- The scraper returns data sorted by `total_impressions` (because the URL sets `sort_data[mode]=total_impressions`)
- Position in the results is itself a signal  - ad #1 has the most impressions, ad #50 has the least
- If the data includes reach/impression estimates, use them. If not, use result position as a proxy.

**Signal 3: Multiple versions (`multipleVersions: true`)**
- If an ad has multiple versions, the competitor is A/B testing copy or creative on that concept
- This means they believe in this angle enough to invest in optimization
- Identify WHAT they are testing: different headlines? Different images? Different CTAs? This reveals their strategy.

**Signal 4: Platform spread**
- An ad running on Facebook + Instagram + Audience Network + Messenger + Threads = broad distribution = high confidence from the media buyer
- An ad only on Facebook = either testing or niche targeting

**Scoring formula:**
```
Winner Score = days_running × platform_count × (2 if multipleVersions else 1)
```

**Selection per competitor type:**

| Competitor Type | Static/Carousel Selection | Video Selection | 90+ Day Rule |
|---|---|---|---|
| `[DIRECT]` | Top 5 for deep analysis | Top 3 for deep analysis | All 90+ day ads regardless of score |
| `[INDIRECT]` | Top 3 for messaging-only analysis | Top 3 for messaging-only analysis | All 90+ day ads (messaging only) |
| `[AUDIENCE]` | Top 3 for audience-overlap analysis | Top 3 for audience-overlap analysis | All 90+ day ads (audience overlap only) |

---

### 4e: Deep Analysis of Winning Static & Carousel Ads

Analysis depth depends on competitor type.

#### DIRECT Competitors  - Full Intelligence Card

For each winning ad from a `[DIRECT]` competitor, produce a full intelligence card. **You MUST view the actual ad images**  - use the image URLs from the scraped data. Claude can see images. Look at them and analyze what you see, do not just describe the metadata.

**1. Identity & Performance Signals**
- Ad Library ID
- Competitor name + `[DIRECT]` tag
- Start date → days running → runtime tier (Test / Promising / Strong / Proven / Evergreen)
- Platforms running on
- Multiple versions? If yes, what is being tested?
- Format (single image / carousel / video)

**2. Copy Breakdown**
- **Body text**  - full ad copy, decoded (fix unicode escapes like `\ud83c\udfe1`)
- **Link title** (headline shown below image)
- **Link description** (subtext below headline)
- **CTA button** text
- **CTA destination**  - where does it send people? (homepage, product page, lead form, landing page?) This reveals funnel strategy.
- **Copy structure classification:**
  - Hook type: Question / Statement / Statistic / Story / Command / Social Proof
  - Body structure: Problem-Agitate-Solve / Benefit stack / Testimonial / Listicle / Direct offer
  - CTA style: Soft (Learn More, Discover) / Medium (Book Now, Get Quote) / Hard (Buy Now, Order Today)

**3. Visual Analysis (LOOK AT THE IMAGES)**

**Load now:** `references/copywriting-knowledge/06-static-and-visual-formats.md`

- **Layout**  - text-heavy vs. image-led vs. split? Grid vs. single focus?
- **Color palette**  - dominant colors, contrast approach, brand colors visible?
- **Typography**  - font style (serif/sans-serif), text size, overlay text on image?
- **Imagery**  - product shot vs. lifestyle vs. UGC-style vs. graphic design vs. before/after?
- **Product placement**  - hero shot, in-context/lifestyle, detail close-up, or absent?
- **Visual hierarchy**  - where does your eye go first? What is the scroll-stopping element?
- **Thumb-stop factor**  - would this make YOU stop scrolling? Why or why not? Be honest.
- For **carousels**: analyze the story arc across slides. What is on slide 1 (the hook slide)? How does the narrative progress? What is the final CTA slide?

**4. Strategic Classification**

**Load now:** `references/copywriting-knowledge/01-psychology-and-persuasion.md`

- **Angle type**  - Problem / Benefit / Desire / Failed Alternative / Objection / Social Proof / Authority / Scarcity / Educational / Seasonal
- **Awareness level:**
  - Unaware (does not know they have a problem)
  - Problem-Aware (knows the problem, not the solution)
  - Solution-Aware (knows solutions exist, not this specific one)
  - Product-Aware (knows this product, has not bought)
  - Most-Aware (knows and likes product, needs a push)
- **Funnel stage**  - Top (awareness/reach) / Middle (consideration/engagement) / Bottom (conversion/retargeting)
- **Emotional trigger**  - which emotion does this ad weaponize? (fear, aspiration, FOMO, curiosity, social proof, urgency, relief, pride)
- **Maslow need level**  - which human need does this ad target?

**5. The "Why This Works" Analysis**
This is the most important part. Do not just describe the ad  - explain WHY it is a winner:
- What makes someone stop scrolling on this?
- What makes them read the copy?
- What makes them click?
- What psychological principle is at play? (social proof, scarcity, authority, reciprocity, loss aversion, etc.)
- If this ad has been running 90+ days, what is the underlying truth that makes it resonate month after month?

#### INDIRECT Competitors  - Messaging-Only Analysis

For each winning ad from an `[INDIRECT]` competitor, produce a reduced card:

- **Identity & Performance Signals** (same as above, tagged `[INDIRECT]`)
- **Copy Breakdown** (full  - same as section 2 above)
- **Strategic Classification** (angle type + awareness level only)
- Skip Visual Analysis and "Why This Works"

The goal: extract messaging strategies, angles, and hooks that a different-solution competitor uses for the same problem. These are transferable to the brand.

#### AUDIENCE Competitors  - Audience-Overlap Analysis

For each winning ad from an `[AUDIENCE]` competitor, produce:

- **Identity & Performance Signals** (same as above, tagged `[AUDIENCE]`)
- **Visual Analysis summary**  - 3-5 bullet points on visual approach, not the full breakdown
- **Emotional register**  - what emotion does this ad operate in? What tone? Aspirational, fear-based, educational, playful?
- **Hook patterns**  - what hooks does this competitor use to capture the shared audience? First line of copy, visual hook element, scroll-stop technique.
- Skip Copy Breakdown and Strategic Classification

The goal: understand what creative approaches resonate with this shared audience in a different product context. These inform tone, visual style, and hook patterns for the brand.

---

### 4f: Video Ad Download, Transcription & Analysis

**Only for DIRECT competitor video winners.** The ad copy text above a video is often just "Watch this" or a short teaser. The REAL messaging  - hooks, scripts, objection handling, CTAs  - is spoken inside the video. Without transcripts, you are missing 80%+ of the competitor's actual strategy.

**Prerequisites:** `whisper.cpp` and `ffmpeg` must be installed. If either is missing, warn the operator and skip transcription  - the rest of Step 4 still works, but flag the data gap.

Process all video ads from DIRECT competitor winners (top 3 from 4d) + all 90+ day DIRECT competitor video ads.

**Step 1: Download videos**
```bash
# Create temp directory for this brand
mkdir -p /tmp/creative-research-videos/{brand-slug}

# Download each video ad (use HD URL first, fallback to SD)
curl -s -L -o /tmp/creative-research-videos/{brand-slug}/{ad-id}.mp4 --max-time 60 "{video_url}"
```

Video URLs come from the scraped data:
```python
videos = snap.get("videos", [])
video_url = videos[0].get("video_hd_url") or videos[0].get("video_sd_url") if videos else None
```

**Step 2: Extract metadata**
```bash
ffprobe -v quiet -print_format json -show_format -show_streams /tmp/creative-research-videos/{brand-slug}/{ad-id}.mp4
```
Extract: duration (seconds), width/height → aspect ratio.

**Aspect ratio detection:**
```python
ratio = width / height
if abs(ratio - 9/16) < 0.05: aspect = "9:16"
elif abs(ratio - 4/5) < 0.05: aspect = "4:5"
elif abs(ratio - 1) < 0.05: aspect = "1:1"
elif abs(ratio - 16/9) < 0.05: aspect = "16:9"
else: aspect = "Other"
```

**Step 3: Extract audio and transcribe**
```bash
# Extract audio as WAV (16kHz mono  - Whisper's preferred format)
ffmpeg -i /tmp/creative-research-videos/{brand-slug}/{ad-id}.mp4 -ar 16000 -ac 1 -f wav /tmp/creative-research-videos/{brand-slug}/{ad-id}.wav -y

# Transcribe with Whisper
whisper-cli -m {model_path} -f /tmp/creative-research-videos/{brand-slug}/{ad-id}.wav --no-prints
```

**Whisper model:** Use `tiny.en` (75MB, fast) if available. `medium.en` (1.5GB) is more accurate but slower. Use whatever model is installed. If the brand's market uses a non-English language (e.g., Dutch), use a multilingual model (not `.en`).

**Step 4: Extract hook from transcript**
- Split transcript on sentence boundaries (`. ! ?`)
- Take the first 1-2 complete sentences as the hook
- If the first sentence is <8 words, include the second sentence

**Step 5: Deep analysis of video ad messaging**

For each transcribed video ad, produce the same full intelligence card as static ads (4e, DIRECT depth), PLUS:

- **Full transcript**  - verbatim
- **Hook (first 1-2 sentences)**  - the opening line that stops the scroll
- **Script structure**  - how is the video organized? (Hook → Problem → Solution → Proof → CTA? Or Hook → Testimonial → Benefit stack? etc.)

**Load now:** `references/copywriting-knowledge/03-script-elements-and-modules.md`

- **Speaker type**  - founder, customer testimonial, UGC creator, voiceover, text-on-screen only?
- **Pacing**  - fast cuts or slow/single-shot? How many scenes?
- **Video duration**  - short (<15s), medium (15-30s), long (30s+)
- **Body copy** (text above the video)  - same copy breakdown as static
- **Link title / description / CTA**  - where does it send people?
- **Angle classification**  - same as static
- **Awareness level**  - same as static
- **What this tells us**  - if their longest-running video ads all use the same angle + script structure, that formula is proven in this market

**Step 6: Clean up**
Delete downloaded video and audio files after processing to save disk space.
```bash
rm -rf /tmp/creative-research-videos/{brand-slug}
```

**Store in a markdown table:** Update the **Competitor Ads** sheet with columns: `Competitor Type`, `Transcript`, `Hook (Video)`, `Video Duration (sec)`, `Video Aspect Ratio`, `Word Count`, `Script Structure`, `Speaker Type`.

---

### 4g: Competitor Strategy Profiles

Before doing the gap analysis, build a strategy profile per competitor. This synthesizes everything scraped into a clear picture of what each competitor is doing.

**Per Competitor:**

- **Competitor Type**  - `[DIRECT]` / `[INDIRECT]` / `[AUDIENCE]`
- **Ad volume**  - total active ads, format breakdown (X% static, Y% carousel, Z% video, W% dynamic)
- **Testing intensity**  - how many ads have `multipleVersions: true`? High = they are actively optimizing. Low = they are set-and-forget.
- **Runtime distribution**  - what % of their ads are <14 days (tests) vs. 30+ days (proven)? A competitor with mostly fresh ads is in testing mode. One with mostly old ads is coasting on winners.
- **Top 3 angles**  - which angle types appear most in their winning ads?
- **Awareness level distribution**  - are they targeting mostly cold (Unaware/Problem-Aware) or warm (Product-Aware/Most-Aware) audiences? This reveals their funnel strategy.
- **CTA pattern**  - where are they sending traffic? Homepage? Product pages? Lead forms? Landing pages? This reveals their conversion strategy.
- **Visual identity**  - consistent look or varied? Stock photos or custom? Lifestyle or product-focused?
- **Messaging themes**  - what 3-5 messages do they repeat most?
- **What is working for them**  - their proven winners (90+ day ads), summarized
- **What is NOT working**  - ads they launched and killed quickly (<14 days), if visible. What did they try and abandon?

**Adjust depth per type:**

| Competitor Type | Profile Depth |
|---|---|
| `[DIRECT]` | Full profile  - all fields above |
| `[INDIRECT]` | Ad volume, top 3 angles, awareness level distribution, messaging themes, CTA pattern. Skip visual identity. |
| `[AUDIENCE]` | Ad volume, visual identity, messaging themes, emotional register. Skip angles and funnel analysis. |

---

### 4h: Competitive Gap Analysis  - Cross-Reference with Research

This is where Step 4 connects to Steps 2-3. The gap analysis is NOT just "what are competitors doing"  - it is "what do CUSTOMERS want (from reviews + Reddit) that NO COMPETITOR is addressing in their ads?"

**1. Messaging Coverage Matrix**

Build a matrix: rows = key customer themes from Steps 2-3 (pain points, desires, triggers, objections), columns = competitors. Tag each column with competitor type.

| Customer Theme (from Reviews + Reddit) | Comp A `[DIRECT]` | Comp B `[DIRECT]` | Comp C `[INDIRECT]` | Coverage |
|---|---|---|---|---|
| Price shock / budget anxiety | 3 ads | 1 ad | 2 ads | Medium |
| Fear of short lifespan | 0 ads | 0 ads | 0 ads | **GAP** |
| Maintenance frustration | 1 ad | 2 ads | 0 ads | Medium |
| "Instagram-worthy" aspiration | 5 ads | 4 ads | 3 ads | Saturated |
| Failed cheap alternatives | 0 ads | 0 ads | 0 ads | **GAP** |

**GAPS = biggest opportunities for the brand.** These are themes customers deeply care about (proven by review/Reddit frequency) that no competitor is running ads against. The brand can own these messaging territories.

**SATURATED themes = the brand needs a differentiated angle** to cut through. Do not run the same ad as every competitor. Find a fresh framing.

**Tag gaps by competitor type:**
- **"No DIRECT competitor addresses this"** = opportunity within the immediate competitive set
- **"No competitor of ANY type addresses this"** = the biggest opportunity. Nobody in the broader market is talking about it. The brand can own this territory outright.

The latter is always a bigger opportunity than the former. Flag these distinctly in the output.

**2. Visual Style Gaps**
- What visual approaches is NO competitor using? (e.g., everyone uses polished product shots → UGC-style is a gap)
- What visual approaches are overused? (e.g., everyone uses white-background product shots → lifestyle photography is a differentiator)

**3. Format Gaps**
- Are all competitors running single images? Then carousel is a gap.
- Is nobody running carousel story arcs? That is an opportunity.
- Is everyone on video but nobody doing static? Static might cut through the noise.

**4. Funnel Stage Gaps**
- Are all competitors only running top-of-funnel awareness ads? Then retargeting/consideration content is a gap.
- Is nobody running educational content (Solution-Aware stage)? That is an opportunity to build trust before competitors do.

**5. Awareness Level Gaps**
- If competitors only target Problem-Aware and Product-Aware audiences, there is an opportunity to go Unaware (create demand) or Most-Aware (close the sale).

**6. Angle Gaps**
- Which of the 5 core angle types (Problem, Benefit, Desire, Failed Alternative, Objection) are untested in this market?
- Which angle types appear in winning ads (90+ days) vs. which appear in killed ads (<14 days)?

**7. Winner Pattern Summary**
What do the TOP 10 ads across ALL competitors (highest Winner Score) have in common?
- Visual style commonalities
- Copy structure commonalities
- Angle/emotional trigger commonalities
- CTA/funnel strategy commonalities
- These patterns = proven market formulas. The brand should use these as their baseline (the "40% proven variations" in the 40/40/20 rule).

**8. Solution Competitor Insights (NEW)**
Cross-reference `[INDIRECT]` competitor findings with `[DIRECT]` competitor findings:
- What angles do indirect competitors use that NO direct competitor uses? These are transferable strategies  - proven messaging for the same problem, just from a different solution category.
- What hooks work for indirect competitors but are absent from the direct competitive set? These can be adapted.
- What awareness levels do indirect competitors target that direct competitors ignore? If all direct competitors target Product-Aware but indirect competitors successfully target Unaware, there is a demand-creation opportunity.

List each transferable strategy with the source competitor, the angle/hook, and a brief note on how to adapt it for the brand.

**9. Audience Competitor Insights (NEW)**
Cross-reference `[AUDIENCE]` competitor findings with the brand's category:
- What creative approaches (tone, visual style, hook patterns) work for the shared audience in different product categories?
- What emotional registers resonate with this audience? If audience competitors succeed with humor but the brand's direct market is all serious/corporate, humor is a differentiation opportunity.
- What formats and content styles drive engagement for this audience? (e.g., if audience competitors thrive on UGC but the brand's market is all polished brand content, UGC is an opening)

These inform the brand's creative direction at the tone/style/hook level, not the messaging level.

---

### 4i: Output & Storage

Reference `technical-reference.md` for all the output folder formatting commands, column specs, and output standards.

**Local files:**
- Raw scraped data: `brands/{brand-slug}/01-research/competitor-ads/{competitor-slug}-[type]-ads.json`
- Full analysis report: `brands/{brand-slug}/01-research/competitor-ads/competitor-intelligence.md`

**a markdown table  - Competitor Ads sheet:**
Store each analyzed ad (the winners from 4e, not every scraped ad) with all intelligence card fields. Create `Competitor Ads  - {Brand Name}` in the brand's Research/ folder if it does not exist. Apply standard header formatting (bold, frozen row, conditional formatting on Runtime Tier).

Include `Competitor Type` as the second column (after Competitor Name) in every sheet and tab. Apply conditional formatting:
- `[DIRECT]` → blue background
- `[INDIRECT]` → orange background
- `[AUDIENCE]` → green background

**a markdown table  - update Competitor Strategy Profiles** (add as a second tab in the Competitor Ads sheet, or store profiles in the analysis report).

**Key numbers to report to operator:**
- Total ads scraped per competitor (with type tag)
- Format breakdown per competitor
- Number of proven winners (60+ days) per competitor
- Top 3 gaps identified (themes customers care about that no competitor is advertising)
- Top 3 saturated themes (where the brand needs differentiation, not imitation)
- Top transferable strategies from indirect competitors
- Top audience insights from audience competitors

---

## Step 4b: Brand Organic Content Analysis

This step analyzes the brand's own organic social media performance. Run this AFTER competitor ad intelligence (Step 4) and BEFORE synthesis (Phase 4). The brand's organic content reveals what already resonates with their audience without paid amplification.

**Do NOT confuse this with competitor analysis. This is the PARTNER's content only.**

---

### Process

**Step 1: Scrape the brand's organic posts.**

Pull 6-12 months of the brand's organic posts from each platform, in parallel where the environment supports it.

**Instagram:**
**Gather the organic content.**

Collect recent posts and their engagement. You are looking for what the brand and its
competitors say when they are not paying for reach.

See `CONNECTIONS.md` → *Organic social data*.

**TikTok (if brand has a TikTok):**
**Gather the organic content.**

Collect recent posts and their engagement. You are looking for what the brand and its
competitors say when they are not paying for reach.

See `CONNECTIONS.md` → *Organic social data*.

**Facebook:**
Pull the brand's own recent posts from their page.

If the brand's social handles are not in the intake, ask the operator. Check the brand's website footer/header for social links.

**Step 2: Calculate engagement rate per post.**

```
Engagement Rate = (likes + comments + shares) / followers × 100
```

If follower count is not available from the scrape, use WebSearch or the profile scraper to get it. Apply the formula to every post.

**Step 3: Rank all posts by engagement rate.**

Sort descending. Identify the top 10-15 performers across all platforms.

**Step 4: Analyze each top performer.**

For each of the top 10-15 posts:

- **Platform**  - Instagram / TikTok / Facebook
- **Format**  - image, video, carousel, text, stories, reel
- **Topic/Theme**  - what is the post about? (product showcase, behind-the-scenes, customer story, educational, promotional, lifestyle, seasonal)
- **Hook**  - first line of caption or visual hook element. What makes someone stop?
- **Engagement breakdown:**
  - High comment ratio (comments > 5% of total engagement) = conversation starter content
  - High share ratio (shares > 10% of total engagement) = value content people pass along
  - High like ratio with low comments = passive appreciation, not deep engagement

**Step 5: Mine comments on top performers.**

Read through comments on the top 10-15 posts. Extract quotes into 5 categories:

1. **Aspiration language**  - "I want...", "Goals", "Dream...", "Need this in my life"
2. **Pain point language**  - complaints, frustrations, problems mentioned in comments
3. **Objections**  - "But...", "What about...", "Too expensive...", "Does this actually work?"
4. **Social proof**  - "I bought this and...", "Best purchase...", recommendations to others
5. **Unexpected insights**  - anything surprising that does not fit the above. These are gold  - they reveal angles nobody is thinking about.

Store verbatim quotes. Never paraphrase. Tag each with the category.

**Step 6: Analyze patterns across all top performers.**

- Which formats consistently drive the highest engagement? (e.g., carousels outperform single images 3:1)
- Which topics/themes resonate most? (e.g., behind-the-scenes posts get 2x average engagement)
- What posting frequency and timing patterns correlate with higher engagement?
- What is the comment sentiment distribution? (positive / negative / neutral  - rough %)
- Are there topics the brand posts about frequently that get LOW engagement? These are wasted effort.

### Output

**a markdown table:** Create `Organic Metrics  - {Brand Name}` in the brand's Research/ folder. Reference `technical-reference.md` for formatting commands.

**Columns:**
| Column | Description |
|---|---|
| Platform | Instagram / TikTok / Facebook |
| Post URL | Direct link to the post |
| Post Date | YYYY-MM-DD |
| Format | image / video / carousel / text / stories / reel |
| Topic/Theme | Categorized topic |
| Likes | Count |
| Comments | Count |
| Shares | Count |
| Engagement Rate | Calculated % |
| Top Comment Quotes | Verbatim quotes from comments (max 3 per post) |
| Sentiment | Positive / Negative / Neutral |
| Insight Category | Aspiration / Pain Point / Objection / Social Proof / Unexpected |

Apply standard header formatting. Add conditional formatting on Engagement Rate column (green = top quartile, yellow = middle, red = bottom quartile).

**Key findings summary:** Write a 10-15 line summary of organic content insights. This feeds into Phase 4 synthesis. Include:
- Top 3 content themes by engagement
- Top 3 hooks that worked
- Most engaged format
- Comment-mined language (top quotes per category)
- Any gaps between what the brand posts and what gets engagement

### If the Brand Has No Organic Social Presence

Flag this to the operator. This itself is critical intel:

- The brand has no organic foundation
- Paid ads must do ALL the heavy lifting  - there is no organic trust layer supporting them
- Competitors with strong organic presence have a trust advantage
- Note this for the strategy agent: recommend organic content strategy as a parallel workstream, or acknowledge that paid creative must build trust from zero (which changes the awareness level targeting  - lean harder on Social Proof and Authority angles)

Record "NO ORGANIC PRESENCE" in the Organic Metrics sheet with a single row noting the finding date and the platforms checked.
