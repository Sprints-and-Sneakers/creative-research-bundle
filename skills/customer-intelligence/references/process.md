# Phase 1: Customer Intelligence

This phase covers all research steps that gather data about the brand's customers. Apply the Certainty Rating System (Step 0b) to every finding.


## Web Research as a Parallel Engine

**The research corpus was created in Step 0c.** Throughout this phase, use it in two ways:

1. **Parallel deep research.** While the structured gathering runs, search the open web for what it cannot reach: niche forums, expert blogs, industry discussions, Quora threads, specialised communities. This doubles as redundancy. If the structured gathering fails entirely, you still have data.

2. **Cumulative knowledge base**  - After each step, add the findings as text sources to the brand notebook. By the time you reach Phase 4 (synthesis), the notebook already has everything loaded.

After completing Steps 1 and 2, add findings to the notebook:

After completing Step 3 (Reddit & Forums), add:

Do the same after Steps 3b and 3c. Each addition makes the notebook smarter for Phase 4.

---

## Step 1: Website & Brand Asset Extraction

Scrape the brand's website to extract brand assets automatically.

### Using WebFetch:

1. Fetch the brand's homepage
2. Extract:
   - **Logo**  - look for `<img>` tags with "logo" in src/alt/class, or `<link rel="icon">`
   - **Colors**  - parse CSS for primary/secondary/accent colors (look for brand color variables, header/button/link colors)
   - **Fonts**  - check `@font-face` declarations, Google Fonts links, or font-family in CSS
   - **Tagline/Value Proposition**  - H1 or hero text on homepage
   - **Product images**  - key product/hero images
   - **Social proof**  - any visible testimonials, review counts, trust badges
   - **Navigation structure**  - main pages (reveals product categories, priorities)

3. Also fetch key inner pages:
   - `/about` or `/over-ons`  - brand story, mission, team
   - `/products` or main product pages  - product details, pricing
   - `/reviews` or `/testimonials`  - if they have an on-site review page

### Using WebSearch:

- Search for `"{brand name}" site:trustpilot.com` to find their Trustpilot page
- Search for `"{brand name}" reviews` to find other review sources

### Output:

Store extracted brand assets in the brand's **Audience Segments** a markdown file (brand overview section) and locally in `brands/{brand-slug}/01-research/brand-assets.md`.

---

## Step 2: Trustpilot Review Scraping & Analysis

**Load now:** `references/copywriting-knowledge/01-psychology-and-persuasion.md` (awareness levels, pain/benefit language, proof framework  - needed to properly categorize review insights)

This is a TWO-PASS process: first the brand's own reviews, then competitor reviews.

### Review Analysis Framework

**CRITICAL: Analyse every review batch with the framework below. Applied inconsistently, review analysis produces impressions instead of evidence.**

**Recurring Threshold: Dynamic, NOT a fixed number.**
- Calculate: **5% of total reviews scraped, minimum 10 mentions**
- For 200 reviews → threshold = 10+
- For 400 reviews → threshold = 20+
- For 100 reviews → threshold = 10 (minimum floor)
- State the threshold in every analysis report header
- A theme below this threshold is noise, not a pattern. Flag it as "rare mention" if noteworthy, but do not include it in the main findings.

### Pass 1: Brand Reviews (100+ minimum)

**Scrape ALL available reviews for the brand. Set `the result limit` as high as possible (1000+). More data = more accurate research output.** If the platform has very few reviews, scrape all and note the shortfall.

**Gather the reviews.**

Pull as many as the source publicly holds. More data means more accurate output; a thin
pool is itself a finding worth documenting.

See `CONNECTIONS.md` → *Review data* for every way to do this: an automated scraper, a
platform export, or reading pages directly with web access. The method below does not
care which one you used.

After the run completes, fetch results from the dataset:
**Gather the reviews.**

Pull as many as the source publicly holds. More data means more accurate output; a thin
pool is itself a finding worth documenting.

See `CONNECTIONS.md` → *Review data* for every way to do this: an automated scraper, a
platform export, or reading pages directly with web access. The method below does not
care which one you used.


**CRITICAL: Always scrape all pages (`endAtPageNumber: 0`). Never cap it lower. If the tool returns far fewer reviews than the source visibly holds, flag it:**

```
⚠️ ISSUE: Only {X} reviews scraped for {brand}. Trustpilot shows {Y} total. Scrape rate: {X/Y}%.
Action needed: check the tool's settings, or try a different source. See CONNECTIONS.md.
```

## MANDATORY: Collection Coverage Gate

Run this before any analysis, on every scrape, no exceptions. Three failure modes lose data
*silently* — the run reports success and the numbers look plausible:

1. **Fetching a dataset while the run is still going.** You get a partial set with no error.
   On one run this returned 320 of 2,800 available reviews (11%).
2. **Capping pagination.** `endAtPageNumber` set to anything but `0` truncates. This cost
   90% of the eat SOUS corpus on the same run.
3. **The per-request item cap.** `/datasets/{id}/items` returns at most ~1000 rows. Without
   `offset` pagination everything past the first page is lost.

Whatever tool you use, make sure it waits for the run to finish, paginates
with `offset`, dedupes, and writes a coverage report:

**Gather the reviews.**

Pull as many as the source publicly holds. More data means more accurate output; a thin
pool is itself a finding worth documenting.

See `CONNECTIONS.md` → *Review data* for every way to do this: an automated scraper, a
platform export, or reading pages directly with web access. The method below does not
care which one you used.

Each target takes `{"name","run","dataset","out","expected"}`. Set `expected` to the review
count shown on the platform's own profile page. **If coverage is under 90%, re-run before
analysing.** Record the final coverage figures in the deliverable's header note so the reader
knows what the findings rest on.

Also check pagination reached the natural end: the last page should be partial (fewer than the
platform's page size). A final page that is exactly full means you stopped early.

**If gathering fails**, follow the Error Recovery Protocol: retry → try an alternative source → manual fallback → log the gap.

**Process the reviews:**
1. Save raw reviews to a temporary file
2. Filter out reviews <5 words or generic praise only
3. Index remaining reviews (Review 1, Review 2, ...)

### Review Analysis Framework

**Analyse every batch the same way  - the brand's own reviews and each competitor's. Consistency is
what makes the sets comparable.**

Before you start:
- Index every review so any later claim can be traced back to a specific one
- Set a recurrence threshold proportional to the sample, and state it in the header. A theme that
  appears once is an anecdote; a theme that clears the threshold is a finding
- Exclude reviews too short to carry meaning, and generic praise with no content

Then work through each of these, quoting verbatim rather than paraphrasing:

1. **What they were trying to solve** — the job they hired the product for
2. **The trigger** — what changed that made them act now
3. **What they tried before** — and why it failed them
4. **Pain language** — how they describe the problem in their own words
5. **Desire language** — how they describe the outcome they wanted
6. **What delighted them** — the moments that exceeded expectation
7. **What frustrated them** — including complaints in positive reviews, which are the most honest
8. **Objections** — hesitations before buying, stated or implied
9. **Recommendation language** — how they describe it to other people
10. **Words they never use** — category jargon that is conspicuously absent
11. **Segment signals** — what distinguishes reviewers from each other
12. **Contradictions** — where reviewers directly disagree, which is usually a segment boundary

**Verbatim quotes are the output.** A summary of what customers feel is worth very little; the
exact sentence a customer wrote is what downstream copy is built from.

### Pass 2: Competitor Reviews (300+ minimum per competitor)

**Scrape ALL available reviews for each competitor. Set `the result limit` to 1000+.** The more competitor data, the sharper the angle mining and differentiation analysis. Gather as many as are publicly available per competitor  - if the pool is small, take all and note the shortfall.

Repeat the same scrape + analysis process for each competitor's Trustpilot page:

**Gather the reviews.**

Pull as many as the source publicly holds. More data means more accurate output; a thin
pool is itself a finding worth documenting.

See `CONNECTIONS.md` → *Review data* for every way to do this: an automated scraper, a
platform export, or reading pages directly with web access. The method below does not
care which one you used.

**Key differences for competitor analysis:**
- Focus on what customers love about competitors (= what brand needs to match or beat)
- Focus on what customers hate about competitors (= brand's opportunity to differentiate)
- Extract competitor UVPs as seen by real customers
- Compare competitor VOC language to brand VOC language

Store competitor review analyses in the same **Review Analysis** a markdown table, tagged by competitor name (add a "Source" column: Brand / Competitor).

---

## Step 3: Reddit & Forums Deep Dive  - Audience Intelligence

**Load now:** `references/copywriting-knowledge/04-angles-and-creative-variety.md` (angle types, creative variety system, leading questions) AND `references/copywriting-knowledge/01-psychology-and-persuasion.md` (Maslow's Hierarchy, awareness levels  - needed to classify which human need each insight maps to)

**Reference SOP:** `agents/creative-research/Reddit Element Research.pdf`  - the original CF Reddit research methodology. This step is the automated, scaled version of that SOP.

This is the deepest research step. The goal is NOT just to find pain points  - it's to understand how the target audience **speaks, feels, thinks, lives, and buys**. You want to know them so well you could describe their Sunday morning routine. The better you understand their world, the better you can phrase their situation in ads  - and the more they trust your solution.

**This step uses TWO research engines in parallel:**
1. **the gathering tool Reddit scraper**  - structured data from Reddit (posts, comments, upvotes, subreddits)
2. **Deep web research**  - finds the niche forums, Quora threads, specialised communities, expert blogs and discussion boards a structured scraper never reaches

Run both at once. The structured gathering gives you depth on Reddit. Web research gives you breadth across everywhere else people discuss this.

---

### 3a: Understand What You're Looking For (The 7 Research Elements)

Before you scrape anything, understand exactly what you're hunting. These are the 7 elements from the CF Reddit Research SOP:

1. **Problem Breakdowns**  - Vivid descriptions of pain points. People on Reddit tell their life story and how problems impact them externally AND internally. Look for the story behind the problem, not just the problem itself.

2. **Personas**  - Redditors tell you exactly who they are, their age, job, family situation, lifestyle. Use this to build and validate ICPs. Example: *"My husband (42m) and I (41f) tried to have children for 13 years before we accepted that we were never going to have it happen for us."*  - That's an entire persona in one sentence.

3. **Failed Solutions**  - What has the customer tried before? Why did it fail? What do they dislike about alternatives? Was it expense? Convenience? Short-term benefits only? This is gold for "Failed Alternative" angles.

4. **Desired State**  - Goals, dreams, what they're working towards, who they aspire to be. When you read "I wish...", pay attention. Sometimes what they say is base level  - expand on it yourself and see what resonates.

5. **Benefit Breakdowns**  - What EXACTLY did the target audience get from the product / competitor / alternative? Not the benefit on the landing page or the feature the founder won't shut up about. Find what the CUSTOMER says the benefit is.

6. **Unique Mechanisms (UMP/UMS)**  - Redditors who've done deep research share studies, product comparisons, root-cause explanations. Look for logical & believable explanations of why the problem exists (UMP = Unique Mechanism of the Problem) and why a solution works (UMS = Unique Mechanism of the Solution).

7. **Scepticism & Objections**  - Why hasn't the target audience bought yet? What questions and objections do they have? You can build entire ad concepts around common objections: Call out objection → handle it → show proof → risk reversal → CTA.

### PLUS: Deep Lifestyle & Psychographic Intelligence

Go beyond product-related insights. You want to understand the **whole person**, not just their buying behavior. Look for:

8. **Lifestyle Signals**  - What else do these people do? What are their hobbies, routines, values? What subreddits do they also frequent? Example: "People buying expensive kitchens also talk about wine collecting, weekend golf, interior design magazines, and holiday homes in France." This kind of intel makes your creative hyper-specific and relatable.

9. **Identity & Status Markers**  - How do they see themselves? What tribes do they belong to? What brands/lifestyles do they associate with? This feeds the Esteem and Belonging levels of Maslow's hierarchy.

10. **Maslow's Hierarchy Mapping**  - For every major insight, identify which level of human need it maps to:
    - **Physiological**  - basic necessity, survival urgency
    - **Safety**  - security, stability, protection, risk removal
    - **Belonging**  - community, family, social connection
    - **Esteem**  - status, prestige, accomplishment, recognition
    - **Self-Actualization**  - purpose, creativity, becoming their best self

    This mapping determines which emotional triggers to use in ads. A luxury kitchen = Esteem + Belonging (hosting, status). A budget kitchen = Safety + Physiological (functional home, nesting). The same product can hit different need levels for different segments.

---

### 3b: Generate Search Terms (Keyword Expansion)

**Do NOT be lazy with keywords.** If you're selling a hair loss supplement, don't just search "hair loss." Search: hair loss, losing hair, hair thinning, balding hair, alopecia, hair regrowth, receding hairline, hair falling out, etc. If you can't find anything meaningful under the obvious keyword, there's something wrong with your search strategy.

For the brand, generate **12-20 search terms** across these 5 categories:

| Category | What to Search | Example (Kitchen Company) |
|----------|---------------|--------------------------|
| **Product terms** | Direct product names, variations, synonyms | "nieuwe keuken", "custom kitchen", "keuken op maat", "fitted kitchen" |
| **Problem/pain terms** | Frustrations, complaints, things going wrong | "keuken spijt", "kitchen renovation nightmare", "keuken te klein", "kitchen regret" |
| **Buying journey terms** | How-to, decision-making, research phase | "hoe keuken kiezen", "how to choose kitchen", "keuken budget", "kitchen worth the money" |
| **Competitor/comparison terms** | Competitor names, vs comparisons, alternatives | "IKEA keuken vs", "Bruynzeel ervaringen", "Keller keuken review" |
| **Emotional/lifestyle terms** | The dream, the aspiration, the fear | "droomkeuken", "keuken verbouwing stress", "kitchen renovation worth it", "finally renovating" |

**CRITICAL  - Language-Specific Search Strategy:**

For Dutch/non-English brands, you MUST run searches in BOTH languages with a clear separation:

**Dutch Reddit** (r/Netherlands, r/wonen, r/Klussers, r/geldzaken, r/zuinig, etc.):
- Smaller community, but hyper-relevant for Dutch market sentiment
- Dutch language terms surface local pricing expectations, local competitors, cultural norms
- People discuss Dutch-specific things: "verbouwingsvergunning", local stores, Dutch weather concerns
- **Tag all findings as `[NL-Reddit]`**

**English Reddit** (r/homeowners, r/BuyItForLife, r/InteriorDesign, r/HomeImprovement, etc.):
- Massive communities, much more data available
- Universal product truths, emotional patterns, and buying psychology apply cross-market
- BUT: pricing, brands, and cultural context may not transfer 1:1 to the Dutch market
- **Tag all findings as `[EN-Reddit]`**

**Why this matters:** A quote from r/homeowners about "$3,000 patio furniture" reveals universal buyer psychology (price shock, durability fears)  - that emotion transfers to the Dutch market even if the dollar amount doesn't. But a Dutch person on r/wonen saying "bij de Ikea keuken planner kom je er niet uit" is directly actionable local intel. Both are valuable, but they serve different purposes. English Reddit gives you emotional depth and volume. Dutch Reddit gives you market-specific precision.

---

### 3c: Find Relevant Subreddits

Use WebSearch to find subreddits where the brand's customers hang out:
- `site:reddit.com "{product category}" OR "{problem the product solves}"`
- `site:reddit.com "best {product type}" OR "recommend {product type}"`
- `site:reddit.com "{competitor name}" review`

Identify **5-8 relevant subreddits per language** (Dutch + English). Also look for adjacent subreddits  - communities where the target persona hangs out even if not directly about the product. Example for a luxury kitchen company: r/wonen, r/Klussers, r/InteriorDesign, but ALSO r/Cooking, r/BuyItForLife, r/HomeImprovement, r/RealEstate  - because kitchen buyers are also home improvers, cooking enthusiasts, and people investing in their property.

**Pro technique from SOP:** When you find a relevant poster, check what other subreddits they post in. If you see a pattern (e.g., kitchen renovation posters also frequent r/wine, r/golf, r/travel), document it  - this builds the lifestyle profile of the persona.

---

### 3d: Scrape Reddit with your gathering tool


**Schema corrected 2026-08-14 — the previous instructions in this file were wrong and silently produced garbage.**

The tools takes **`searches` (an ARRAY of query strings)**. There is no `search` or `searchTerm` field.
Passing those fields does not error — the tools ignores them and crawls default/trending Reddit
instead, so the run "succeeds" while returning completely unrelated content. On one run
this produced celebrity subreddits for private-chef queries.

**Always set `includeNSFW: false`.** It defaults to `true`, which is the other half of why the bad
run surfaced celebrity content.

**Gather the reviews.**

Pull as many as the source publicly holds. More data means more accurate output; a thin
pool is itself a finding worth documenting.

See `CONNECTIONS.md` → *Review data* for every way to do this: an automated scraper, a
platform export, or reading pages directly with web access. The method below does not
care which one you used.

Group searches into one run per language so datasets stay separable and one failure cannot
take out the whole set.

**Verify relevance before you analyse anything.** Read the run log and confirm it shows
`Processing https://www.reddit.com/search/?q=<your actual query>`. Then eyeball the first
10 records for subreddit names that make sense for the niche. A run that returns 500 items
from the wrong subreddits is worse than a run that returns nothing, because it looks like data.

Note: `type=comments` search URLs return 403 fairly often. Post search still works, and comments
come back through `skipComments: false` on the posts themselves.

After each run completes, fetch results from the dataset:
**Gather the reviews.**

Pull as many as the source publicly holds. More data means more accurate output; a thin
pool is itself a finding worth documenting.

See `CONNECTIONS.md` → *Review data* for every way to do this: an automated scraper, a
platform export, or reading pages directly with web access. The method below does not
care which one you used.

**If gathering fails**, follow the Error Recovery Protocol: retry → try an alternative source → manual fallback → log the gap.

---

### 3e: Relevance Triage (Filter Before You Analyze)

**Do NOT analyze every post.** The scraper will return noise  - random posts that mention a keyword but aren't relevant. Before deep analysis, triage:

1. **Read every post title + first few lines**
2. **Score relevance 1-5:**
   - **5** = Directly about the brand's product category, contains personal experience/opinion
   - **4** = About the broader category, contains useful emotional language or buying context
   - **3** = Adjacent topic but contains transferable insight (lifestyle, persona, psychology)
   - **2** = Tangentially related, might have one useful quote buried in comments
   - **1** = Not relevant (wrong product, wrong context, spam, memes)
3. **Only deeply analyze posts scoring 3+**
4. **Discard 1-2 scores entirely**  - don't waste analysis on irrelevant data

Save the triaged, relevant posts to a local file at `brands/{brand-slug}/01-research/reddit/reddit-relevant.json` before proceeding.

---

### 3f: Deep Analysis (The Actual Gold Mining)

For every relevant post (score 3+), extract a structured insight card:

**Per Post/Comment:**
- **Verbatim Quote**  - the exact words. Never paraphrase. The whole point is to use THEIR words in OUR ads.
- **Source**  - subreddit, username, URL, date, upvote count
- **Language**  - `[NL-Reddit]` or `[EN-Reddit]`
- **Research Element**  - which of the 7 elements does this map to? (Problem / Persona / Failed Solution / Desired State / Benefit / Unique Mechanism / Scepticism)
- **Maslow's Need Level**  - Physiological / Safety / Belonging / Esteem / Self-Actualization
- **Emotional Temperature**  - what emotion is driving this post? (frustration, fear, hope, pride, regret, excitement, anxiety, relief)
- **Ad Potential**  - how could you use this in an ad? Be specific: "Hook for problem-agitation video targeting renovation procrastinators" or "Social proof testimonial-style static for retargeting"
- **Certainty Level**  - High (10+ similar posts/comments across multiple subreddits) / Medium (3-9 echoes) / Low (1-2 mentions) / Speculative (inferred from adjacent data, no direct mention)
- **Cross-Source Check**  - Does this finding also appear in Trustpilot reviews? Mark `[Confirmed: Reviews]` or `[Reddit-only]`. Cross-confirmed findings get bumped up one certainty level.
- **Channel Fit**  - Which ad channel(s) would this insight work best on? (Meta, TikTok, YouTube, Google)

**From Comments (read them  - the gold is in the comments):**
- Look for users **confirming** what the OP said  - confirmation = higher confidence
- Look for users **expanding** the story to their own life  - this gives you persona details and additional language
- Look for users **disagreeing**  - this surfaces objections and counter-arguments

**Headline Harvesting:** Redditors write excellent headlines. If a post title makes you want to click immediately, **save it as hook inspiration**. Tag it separately as `headline-inspo`.

**Profile Pattern Mining:** When you find a particularly relevant poster (someone who clearly IS the target persona), note what other subreddits they're active in. If you see patterns across multiple profiles (e.g., luxury kitchen buyers are also in r/wine, r/investing, r/travel, r/golf), document this as a **Lifestyle Pattern**  - this is the "golf club on Sunday" level intel that makes creative hyper-specific.

---

### 3g: Synthesis  - Turn Data Into Intelligence

After individual post analysis, step back and synthesize. This is where raw data becomes actionable strategy. Write a synthesis report covering:

**1. Top Findings per Research Element** (ranked by mention volume + certainty)

For each of the 7 elements, produce a ranked certainty table:

| Rank | Finding | Mention Volume | Certainty | Cross-Source | Channel Fit | Best Quote |
|------|---------|---------------|-----------|--------------|-------------|------------|
| 1 | [theme] | X/total (Y%) | High | [Confirmed: Reviews] | Meta, TikTok | "verbatim" |

For each finding, list:
- The pattern/theme
- Mention volume: `X/total (Y%)`
- Certainty level (per Step 0b system)
- Cross-source validation: does this also appear in reviews? `[Confirmed: Reviews]` or `[Reddit-only]`
- Channel fit: which ad channels this insight works best on
- Representative quote (the single best verbatim quote)

**2. Audience Lifestyle Profile**

Based on lifestyle signals, profile patterns, and psychographic intel:
- What does their typical week look like?
- What other products/brands do they buy?
- What do they do on weekends?
- What are they proud of? What are they insecure about?
- What communities do they identify with?
- What does their social media consumption look like?

**3. Maslow's Hierarchy Heat Map**

Which need levels came up most? This tells you where to aim your emotional triggers:
- If mostly Safety/Physiological → lead with risk removal, protection, practical benefits
- If mostly Esteem/Belonging → lead with status, social proof, aspiration, community
- If mixed → segment your creative by need level (different ads for different motivations)

**4. Dutch vs English Reddit Delta**

What showed up in Dutch Reddit that DIDN'T show up in English, and vice versa? Specifically:
- Dutch-specific pain points (local pricing, regulations, weather, cultural expectations)
- Universal patterns confirmed across both (these are highest-confidence insights)
- English-only insights that likely transfer to NL market (emotional patterns, buying psychology)
- English-only insights that do NOT transfer (US pricing, US brands, US cultural norms)

**5. Surprises & Contradictions**

What did you find that was unexpected? What contradicts the Trustpilot review data or the brand's own assumptions? Flag these  - surprises are often the most valuable insights because nobody is running ads against them.

**6. Top 15 Verbatim Quotes for Ads**

The 15 best quotes, ranked by ad potential. For each:
- The exact quote
- Source (subreddit, user, date, upvotes)
- Language tag (`[NL-Reddit]` / `[EN-Reddit]`)
- Suggested ad use (hook, body copy, testimonial-style, problem-agitation, etc.)
- Which persona/segment it speaks to

**7. Top 5 Reddit Headlines as Hook Inspiration**

Post titles that made you want to click. Explain what makes each one effective.

---

### 3h: Forum & Community Research (runs alongside the structured gathering)

**Run this alongside the structured Reddit gathering (steps 3d-3g).** While that pulls Reddit itself, web research covers the rest: forum discussions, niche communities, and expert content Reddit never sees.

**Launch 3-5 research queries** targeting forums and communities beyond Reddit:


Wait for the results.

**What you're looking for in forum results:**
- **Niche forums** that Reddit doesn't cover: health forums, parenting forums, hobby communities, professional forums, and the local-language forums that dominate in non-English markets. Every market has two or three of these and they are usually where the most candid discussion happens.
- **Quora threads** where people ask detailed questions about the product category
- **Expert blogs** with comment sections where customers discuss experiences
- **Review sites beyond Trustpilot** (Google Reviews, Kiyoh, consumer comparison sites)
- **Industry-specific communities** (for B2B: LinkedIn groups, Slack communities; for health: patient forums; for home improvement: contractor forums)

**Process the web research results:**
1. For each research result, extract the same data as the gathering tool Reddit findings (verbatim quote, source, research element, Maslow level, emotional temperature, ad potential, certainty)
2. Tag the source as `Forum`, `Quora`, `Expert Blog`, `Review Site`, or `Community` (not `Reddit`)
3. Cross-reference with Reddit findings  - if a forum finding confirms a Reddit finding, bump both to higher certainty
4. Add the best sources to the brand notebook:

**Why this matters:** Reddit is one platform. Niche forums are where the most passionate, knowledgeable customers hang out. A local-language forum for a specific trade will have deeper, more specific discussion than the big general subreddit. Web research finds those; a structured scraper pointed at Reddit will not.

---

### 3i: Output & Storage

**Local file:** Save the full synthesis report at `brands/{brand-slug}/01-research/reddit/reddit-synthesis.md`

**a markdown table:** Store ALL findings (Reddit + Forums) in `Reddit & Forums Research  - {Brand Name}` (in the brand's Research/ folder). Key columns:
- Title (post title or first line of comment)
- Source Platform (Reddit / Quora / Forum / Expert Blog / Review Site / Community)
- Subreddit or Forum Name
- Post URL
- Content (verbatim quote  - never paraphrase)
- Language Source (`NL-Reddit` / `EN-Reddit` / `NL-Forum` / `EN-Forum`)
- Research Element (Problem / Persona / Failed Solution / Desired State / Benefit / Unique Mechanism / Scepticism / Lifestyle Signal)
- Maslow Need Level (Physiological / Safety / Belonging / Esteem / Self-Actualization)
- Emotional Temperature (the dominant emotion)
- Ad Potential (specific use case)
- Upvotes or Engagement (proxy for resonance)
- Relevance (High / Medium / Low)
- Confidence (High / Medium / Low)
- Cross-Source Check (Confirmed by: Reddit / Forum / Reviews / etc.)
- Scrape Date

### When the niche is genuinely quiet (document it, don't force it)

Some categories have almost no public discussion in some markets. On one engagement
(private chefs, NL + FR, 2026-08), 17 queries across three languages returned ~3,000 raw Reddit
records that triaged down to **30 Dutch and 26 French on-topic records — one real thread per
market.**

Two rules follow.

**Do not pad.** A scraper returning 1,000 records for a quiet niche is returning noise, and noise
that survives into an analysis is far more damaging than a documented shortfall. Triage hard,
report the true count, and say plainly that the niche has low discussion presence.

**Write it up as a finding.** Silence is evidence about how a category is bought. If nobody
discusses a purchase publicly but hundreds review it afterwards, that asymmetry tells you the
decision is private, the prospect arrives cold with nobody having answered their doubts, and paid
creative is carrying category education alone. That materially changes the creative brief -
it argues for education and objection-handling over differentiation. Put it in the audience
deliverable, not in a footnote.

**Minimum output bar:** 30+ verbatim quotes and at least 15 usable copy elements across Reddit + forums combined. If Reddit alone doesn't hit this minimum, the forum research should fill the gap. If both together still fall short, flag it  - the search terms were too weak or the niche has low online discussion presence.

**Add findings to the brand notebook:**

---

## Step 3b: LLM Element Research

Run 8 structured prompt sequences against the brand's product context (website data from Step 1 + intake answers from Step 0). Use WebSearch and the brand's website data as context for each sequence.

**Load now:** `references/copywriting-knowledge/01-psychology-and-persuasion.md` (awareness levels, benefit framing, emotional triggers  - needed to classify LLM-generated insights properly)

### The Element Sequences

Work through these in order, feeding the brand's product information, site copy and intake answers
as context. Each builds on the last.

1. **Benefits** — every benefit the product offers: functional, emotional, social, aspirational.
   From the customer's perspective, not the brand's marketing copy.
2. **Mechanism** — for each benefit, how the product actually delivers it. Feature → outcome → payoff.
3. **Who it is for** — which kind of person each benefit matters most to, and why.
4. **External problems** — the practical, visible problem the customer has.
5. **Symptoms** — how that problem shows up in daily life.
6. **Internal problems** — what the external problem makes them feel about themselves. This is where
   the strongest copy comes from, and where most research stops too early.
7. **Desired states** — what life looks like once it is solved. Concrete scenes, not adjectives.
8. **Failed solutions** — what they tried before, and the story they now tell about why it failed.

**Cross-reference every output against the review and forum data.** Anything generated here that no
real customer ever said is a hypothesis, not a finding. Label it as one or drop it. This step is
the easiest place in the whole pipeline to manufacture confident nonsense.

## Step 3c: Organic Audience Mastery

Mine the brand's organic social media presence for real customer language. This step captures how customers talk about the brand in the wild  - unprompted, unfiltered, in their own words.

**If the brand has no social media presence or very low engagement (fewer than 5 comments on their top posts), flag the gap and skip this step.** This is common for B2B or newer brands.

### Data Sources

Scrape the brand's social profiles across all available platforms:
- **Instagram** posts + comments  - gather Instagram posts and comments
- **Facebook** page posts + comments
- **TikTok** videos + comments  - use the gathering tool TikTok scraper (tools: `clockworks/tiktok-scraper`)
- **LinkedIn** posts + comments
- **Twitter/X** mentions and discussions about the brand  - gather Twitter/X posts

### What to Extract from Comments

Read every comment looking for:
- **Problem breakdowns**  - vivid descriptions of pain, frustrations shared publicly
- **Persona/identity clues**  - self-described roles, life stage, situation ("as a mom of three...", "just bought my first house...")
- **Failed solutions**  - why they rejected alternatives ("tried X but it didn't...")
- **Desired state/aspiration language**  - "I wish...", "I just want...", "If only..."
- **Benefit language**  - what customers say they gained ("this changed my...", "finally I can...")
- **Skepticism/objections**  - doubt language, uncertainty ("is this really worth...", "seems too good to...")
- **Emotional tone and intensity cues**  - caps, exclamation marks, emoji patterns, story length
- **Social proof language**  - recommendations, warnings, tags of friends

### Process

1. Scrape the brand's last 6-12 months of posts across all available platforms
2. Sort by engagement (likes + comments + shares)
3. Focus on the top 15-20 posts by engagement
4. Read ALL comments on those posts  - the gold is in the comments
5. Capture every relevant quote verbatim with this structure:

| Platform | Post URL | Exact Quote | Sentiment Tag | Emotion Tag | Theme/Insight | Copy-Ready Line | How to Use in Creative |
|----------|----------|-------------|---------------|-------------|--------------|-----------------|----------------------|

6. Apply the Certainty Rating System: organic comments are real customer language  - **start at "Medium" certainty**. Upgrade to "High" if the insight is corroborated by Trustpilot reviews (Step 2) or Reddit data (Step 3).

### Output


- **`Organic Intelligence  - {Brand Name}`** (a markdown file) in the brand's Research/ folder  - narrative synthesis with:
  - Top themes across platforms
  - Recommended angles derived from organic engagement patterns
  - Copy-ready lines extracted directly from customer comments
  - Platform-specific insights (what performs on Instagram vs TikTok vs Facebook)
- Feed all raw quotes into the VOC Dictionary (Phase 4)
