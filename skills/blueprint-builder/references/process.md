# Blueprint Builder  - Full Process Reference

This file contains the complete step-by-step instructions for the Blueprint Builder agent. Load this when executing the skill.

---

## Step 8: Build the Psychological Blueprint

**Load before starting:**

### 8a: Identify Audience Segments

Based on ALL the research data  - customer research, competitor analysis, past performance, and external sources  - identify **3-5 distinct buyer segments**.

Each segment must buy for completely different reasons. Segmentation criteria:

| Factor | Question |
|---|---|
| **Motivation** | What drives them to look for this solution? |
| **Pain intensity** | How urgent is their problem? |
| **Buying context** | First-time buyer vs. upgrader vs. switcher? |
| **Decision process** | Impulse vs. researched vs. committee? |
| **Price sensitivity** | Budget-driven vs. value-driven vs. premium? |
| **Awareness level** | Where do they sit on the awareness spectrum? |

Don't segment by demographics alone. Two 35-year-old men might be in completely different segments if one is a first-time buyer driven by status and the other is a repeat buyer driven by reliability.

**Format in the doc:**
- HEADING_1: "Audience Segments"
- HEADING_2: Each segment name (e.g., "Segment 1: The Anxious First-Timer")
- Brief description of who they are and why they're distinct

### 8b: Build ICPs (9-Point Profiles per Segment)

For EACH segment, document all 9 points. Every point must include verbatim VOC quotes with source attribution.

#### Point 1: Pain Points
Use exact language from reviews, Reddit, and organic comments. Cite the source.
- NOT: "Customers experience frustration with pricing transparency"
- YES: *"I had NO idea what it would cost until the 3rd meeting"*  - Trustpilot, 2-star review

#### Point 2: Desires
Dream state in customer language.
- NOT: "Customers want quality results"
- YES: *"I just want to walk in and feel like, wow, this is MY space"*  - Reddit r/homeimprovement

#### Point 3: Emotional & Purchase Triggers
What events or emotions drive the purchase decision. Specific moments, life changes, emotional states.

#### Point 4: Failed Alternatives
What they tried before this brand's solution. Source from LLM Elements research + Reddit.
- What did they try? Why did it fail? What language do they use to describe the failure?

#### Point 5: Objections
What stops them from buying. Verbatim doubt language.
- Price objections, trust objections, timing objections, comparison objections

#### Point 6: Unique Value Propositions
What customers say makes this brand different  - in THEIR language, not the brand's marketing copy.

#### Point 7: Features & Benefits
Specific features tied to specific benefits, per persona. From LLM Elements research.
- Feature: "3D kitchen visualization" -> Benefit for Anxious First-Timer: "I could see exactly what I was getting before committing"

#### Point 8: Uncertainties & Perceived Risks
Worries before purchasing. Different from objections  - these are unspoken fears.
- "What if it doesn't look like the render?"
- "What if they go over budget?"

#### Point 9: Misconceptions & Failed Solutions
Wrong beliefs the audience holds + solutions they've tried that don't work.
- Misconception: "All kitchens take 6 months" -> Reality: brand delivers in 8 weeks
- Failed solution: "Tried IKEA but the quality was terrible for the price"

### 8c: Awareness Level Mapping (Per Persona)

Map each persona across all 5 awareness levels:

| Awareness Level | Description | Is This Persona Here? | Estimated % | Hook Direction |
|---|---|---|---|---|
| **Unaware** | Doesn't know they have a problem | Yes/No | % | Pattern interrupt, curiosity |
| **Problem-Aware** | Feels the pain, hasn't started looking | Yes/No | % | Agitate pain, validate frustration |
| **Solution-Aware** | Knows solutions exist, comparing options | Yes/No | % | Differentiate approach |
| **Product-Aware** | Knows the brand, actively evaluating | Yes/No | % | Social proof, objection handling |
| **Most Aware** | Ready to buy, needs final push | Yes/No | % | Offer, urgency, CTA-heavy |

The estimated percentages should reflect where the MAJORITY of each persona currently sits based on research data. This directly influences ad strategy  - if 60% of Segment 1 is Problem-Aware, most ads for that segment should target Problem-Aware.

### 8d: Humanize Each Persona

For each persona, create a vivid human portrait:

| Element | What to Include |
|---|---|
| **Name** | A realistic first name |
| **Age** | Specific age, not a range |
| **Lifestyle** | Job, family situation, daily routine highlights |
| **Daily routine** | Morning to evening  - where does this product/service fit? |
| **Discovery** | How they first became aware of the category |
| **Behavioral details** | How they research, who they ask, what platforms they use |
| **Emotional state** | How they feel about the problem RIGHT NOW |
| **Decision trigger** | The specific moment they go from "thinking about it" to "actively looking" |

The goal: a copywriter reading this persona should be able to write an ad that speaks directly to this person without needing any other research.

### 8e: Positioning & Value Equation

Assess the brand's current positioning using the Value Equation:

```
Value = (Dream Outcome x Likelihood of Success) / (Time x Effort)
```

For each element:
- **Dream Outcome**  - What the customer ultimately wants. How well does the brand deliver on this?
- **Likelihood of Success**  - How confident is the customer they'll get the result? What proof exists?
- **Time**  - How long does it take? Is this faster or slower than alternatives?
- **Effort**  - How much work does the customer have to do? Is this easier or harder than alternatives?

**Scoring:** Rate each element 1-10 based on research data. Calculate the ratio.

**Critical rule:** If the offer is weak (low Dream Outcome, low Likelihood, high Time, high Effort), FLAG IT prominently. Write it in bold at the top of this section:

> **OFFER FLAG: [specific issue]. No amount of great creative fixes a broken offer. Recommend addressing [specific fix] before scaling ad spend.**

If the offer is strong, note the strongest elements  - these become the lead message in ads.

### Document Structure

The final `audience-segments.md` should be structured as:

```
# Audience Segments  - {Brand Name}

## Audience Segments Overview
   Brief summary of all segments

## Segment 1: {Name}
### ICP Profile
    All 9 points with VOC quotes
### Awareness Mapping
    Table with levels and percentages
### Persona: {Human Name}
    Humanized portrait

## Segment 2: {Name}
   (same structure)

... repeat for all segments ...

## Positioning & Value Equation
   Value equation assessment
   Offer flags (if any)
```
