# Deep Researcher  - Full Process Reference

This file contains the complete step-by-step instructions for the Deep Researcher agent. Load this when executing the skill.

---

## Step 6: Deep Web Research  - Authoritative External Sources

Steps 1-5 (run by other agents) capture what customers SAY, what competitors DO, and what the brand's own ads have achieved. This step adds the third layer: what the DATA actually shows. Clinical studies, industry reports, market data  - these give ads authority that competitors running only on vibes don't have.

### 6a: Define Research Queries

Based on the brand's niche and findings from earlier agents, generate **5-8 research queries** targeting:

| Query Type | What to Find |
|---|---|
| **Scientific/clinical** | Studies, trials, peer-reviewed data relevant to the product |
| **Industry reports** | Market sizing, trends, growth data |
| **Expert content** | Niche blogs, specialist opinions, practitioner insights |
| **News/media** | Recent articles, regulatory changes, cultural shifts |
| **Niche forums** | Specialist communities beyond Reddit |

### 6b: Run the Web Research

For each query:


Wait for the results.

Run all 5-8 queries. For each result:
- Evaluate source credibility (peer-reviewed > industry report > blog > forum)
- Extract key data points, statistics, and expert quotes
- Note the source URL and publication date for attribution

### 6c: Add External Sources to Brand Notebook

The brand notebook was created during intake and has been incrementally loaded by Customer Intelligence and Market Intelligence. Now add the external research sources:

Import the **5-10 strongest external sources** as URL sources:

At this point the notebook contains data from all research phases  - ready for cross-source synthesis.

### 6d: Output & Storage

Create `Research Sources  - {Brand Name}` (a markdown table in Research/ folder).

**Sheet columns:**
| Column | Content |
|---|---|
| Source Title | Name of the source |
| URL | Full URL |
| Source Type | scientific / industry / expert / news / forum |
| Key Finding | 1-2 sentence summary of what's useful |
| Credibility Rating | High / Medium / Low |
| Data Points Extracted | Specific stats, quotes, facts |
| Relevant Segment | Which audience segment this applies to |

**Format the sheet:** Bold header row, freeze row 1, auto-resize columns.

Write a **key findings summary** (500 words max) as a text note or separate section highlighting:
- 3-5 most powerful data points for ads
- Anything that validates customer claims from reviews/Reddit
- Anything that CONTRADICTS common customer beliefs (= myth-busting angles)
- Authority-building facts the brand can claim


---

## Step 7: Cross-Source Synthesis

All research data from 7 source types now exists. This step connects them into a unified intelligence layer.

### Source Types for Cross-Validation

1. Trustpilot Reviews (brand + competitors)
2. Reddit Research
3. LLM Element Research
4. Competitor Ad Analysis (direct + indirect + audience)
5. Brand Organic Social (comments + engagement data)
6. Brand Historical Ad Performance (winner/loser patterns)
7. External Research (web research and industry data)

### 7a: Verify Notebook Contents

The brand notebook should already contain most data from earlier agents. Verify it has sources from all completed phases. If anything is missing, add it now:


**Checklist  - verify these sources exist in the notebook:**
- [ ] Brand website (added during intake)
- [ ] Review analysis findings (added by Customer Intelligence)
- [ ] Reddit & forum synthesis (added by Customer Intelligence)
- [ ] LLM Element Research findings (added by Customer Intelligence)
- [ ] Organic Intelligence findings (added by Customer Intelligence, if applicable)
- [ ] Competitor intelligence (added by Market Intelligence)
- [ ] Performance Intelligence winner/loser patterns (add now if Performance Analyst ran)
- [ ] External research URLs (added in Step 6c above)

If any are missing, add them before running synthesis queries.

### 7b: Run Structured Synthesis Queries

Query the corpus systematically:

**Audience & Pain:**
- "What are the top pain points across all sources  - reviews, Reddit, organic comments, and research data  - ranked by frequency and emotional intensity?"
- "What language do customers use to describe their dream outcome versus how the brand and competitors describe it?"
- "What purchase triggers appear across both Reddit AND reviews? Which are unique to each source?"

**Competitive Intelligence:**
- "What messaging angles are competitors using that customers don't actually care about based on review data?"
- "What do customers consistently praise about competitors that this brand lacks?"
- "What competitor weaknesses do customers mention that this brand could exploit?"

**Performance Intelligence (if available):**
- "Which themes from the research data align with the brand's historically winning ad angles?"
- "Which customer pain points have NEVER been tested in the brand's ads?"
- "What patterns from winning ads can we replicate with new angles from the research?"

**Evidence & Authority:**
- "What scientific or industry data supports the most common customer pain points?"
- "What common customer beliefs are contradicted by the research data? These are myth-busting opportunities."

**VOC Mining:**
- "List the 30 most emotionally charged phrases customers use across all reviews, Reddit posts, and organic comments"
- "What metaphors or comparisons do customers use to describe their experience?"

Store all query results  - they feed the VOC Dictionary, Gap Matrix, and downstream agents.

### 7c: Build the VOC Dictionary

Create `VOC Dictionary  - {Brand Name}` (a markdown file in Research/ folder).

**Use HEADING_1 for the title, HEADING_2 for each category.**

#### Category 1: Power Phrases
15-20 most emotionally charged verbatim lines. Each with:
- The exact quote (italicized)
- Source attribution (e.g., "Trustpilot review, 4-star, 2024")
- Suggested ad use (e.g., "Hook line for Problem-Aware audience")

#### Category 2: Pain Language
How customers describe frustrations IN THEIR OWN WORDS. Organized by pain category.
- NOT: "customers experience price anxiety"
- YES: *"I had NO idea what it would cost until the 3rd meeting"*

#### Category 3: Desire Language
How customers describe their dream outcome.
- NOT: "customers want a beautiful kitchen"
- YES: *"I just want to walk in and feel like, wow, this is MY space"*

#### Category 4: Objection Language
How they express doubt before buying.
- Example: *"How do I know it won't fall apart in 3 years like the last one?"*

#### Category 5: Recommendation Language
How they tell others to buy (or warn them away). Ready-made testimonial hooks.

#### Category 6: Words They Use
Actual vocabulary: terms, slang, shorthand, specific phrases the audience uses naturally.

#### Category 7: Words They NEVER Use
Marketing jargon the brand uses that customers don't. Rule: If customers don't say it, we don't say it in ads.

#### Category 8: Competitor-Specific Language
Nicknames, abbreviations, comparisons ("X is like Y but...").

**Formatting:** Bold labels, italicize all verbatim quotes, source attribution after each quote.

### 7d: Build the Competitive Messaging Gap Matrix

Create `Competitive Gap Matrix  - {Brand Name}` (a markdown table in Research/ folder).

**Sheet columns:**

| Column | Content |
|---|---|
| Customer Need/Pain | What the customer wants or struggles with |
| Frequency/Intensity | How often + how strongly this appears in data |
| What Competitors Message | How competitors currently address this |
| What Customers Actually Say | Verbatim customer language about this |
| The Gap | Where competitor messaging misses customer reality |
| Strategy Implication | What this means for creative |
| Opportunity Rank | 1-N ranking by opportunity size |

**Tagging rules:**
- "No DIRECT competitor addresses this" = moderate opportunity
- "No competitor of ANY type addresses this" = massive opportunity

**Conditional formatting:** Green for "GAP" cells, red for "Saturated". Bold header, freeze row 1, auto-resize.

**Output:** Top 5-8 gaps ranked by opportunity size (frequency x intensity x competitive whitespace).

---

## Step 7b: Creative Provocation Layer

This step asks: what SHOULD we be doing that nobody else is? This feeds the strategy agent's 20% Wildcard allocation.

### Contrarian Findings

Review ALL data from earlier agents:
- What do customers want that NO competitor addresses?
- What do competitors all do that customers DON'T care about?
- What assumptions are all competitors making that data contradicts?
- What review complaints are universal across ALL competitors? (= industry-level problem)

### Whitespace Map

Build creative territories nobody owns:
- Untested angle types in this market
- Untested formats (everyone does video but nobody does carousel storytelling?)
- Untested emotional registers (everyone serious but nobody using humor?)
- Untested awareness levels (everyone targets Most Aware but ignores Problem-Aware?)
- Untested channels

### Cross-Industry Inspiration

Query the corpus, or search the web:
- What's working in ADJACENT industries that could transfer?
- What creative approaches from other categories could disrupt this space?
- What emerging ad formats or trends could be first-mover advantages?

### "What If" Provocations

Generate 5-10 creative hypotheses:

| # | Provocation | Why It Could Work | Risk | Channel Fit |
|---|---|---|---|---|

Tag everything as Certainty: Speculative.

### Storage

Add the Creative Provocation Layer as the final section of the VOC Dictionary doc (under HEADING_1: "Creative Provocation Layer"). Include all contrarian findings, whitespace map, cross-industry inspiration, and "What If" table.
