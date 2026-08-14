# Connections

What data this pipeline needs, where to get it, and what degrades if you cannot.

The skills are written against **data classes**, not vendors. They ask for "reviews" and do not
care whether you scraped them, exported them, or read them off a page. This file is the map from
each class to the ways of getting it.

**The headline:** almost nothing here requires a paid API. Paid tools buy you *volume and
repeatability*, not access. You can run this whole pipeline with a browser and some patience. It
just takes longer and covers less.

---

## What each class is for

| Data class | Feeds | Without it |
|---|---|---|
| Review data | VOC dictionary, pain/desire language, segments | **Fatal.** This is the spine. Everything downstream is assumption. |
| Community & forum data | Unprompted language, objections, triggers | Severe. You lose how people talk when not asked. |
| Competitor ad data | Gap matrix, competitive landscape, proven angles | Severe. You cannot find whitespace without knowing what is already occupied. |
| Organic social data | Themes, formats, engagement patterns | Moderate. Note the gap and continue. |
| Own performance data | Winner DNA, anti-patterns, benchmarks | Moderate. Most brands lack it. Skip explicitly. |
| Search & keyword data | Demand sizing, question mining | Optional. Useful, never load-bearing. |
| A synthesis layer | Cross-source patterns, contradictions | Claude is one. See below. |

If review data is missing, stop and get it. If anything else is missing, record the gap in the
brief and carry on. A named gap is itself a finding.

---

## Review data

**The point:** how customers describe the problem, in their words, at the moment they were
motivated enough to write something down.

**Where it lives:** Trustpilot, Google Reviews, Amazon, Yelp, Capterra, G2, app stores, Reddit
threads about the brand, and the brand's own testimonials and support inbox.

| How | Cost | Volume | Notes |
|---|---|---|---|
| The brand's own export | Free | High | Overlooked constantly. They already own this. Ask first. |
| Read pages with web access | Free | Low to medium | Claude can read public review pages directly. Fine for tens, not thousands. |
| A scraping service | Paid | High | Apify, Bright Data, Firecrawl and similar. Buys volume and repeatability. |
| Copy and paste | Free | Low | Genuinely viable. Fifty real reviews beats zero. |

**Target:** as many as the source publicly holds. Stop when new reviews stop producing new
themes. Past that point you are paying for repetition.

**Watch for:** a tool returning far fewer results than the source visibly holds. That is a silent
failure, not a small dataset. Check the source's own count before trusting a result.

---

## Community & forum data

**The point:** what people say when no one asked them and no brand is listening. The highest-value
language in the whole pipeline, because it is unperformed.

**Where it lives:** Reddit, niche forums, Facebook groups, Discord servers, product communities,
comment sections, Q&A sites.

| How | Cost | Volume | Notes |
|---|---|---|---|
| Read directly with web access | Free | Medium | Reddit is publicly readable. This works without any tooling. |
| A scraping service | Paid | High | Worth it when you need entire threads with comment trees. |
| Site search | Free | Medium | `site:reddit.com "[your phrase]"` in any search engine is underrated. |

**Depth beats breadth.** One long thread where people argue about the problem is worth more than
fifty shallow posts.

**If the niche is quiet:** document it rather than forcing it. "No meaningful public discussion
exists in this category in this market" is a real finding with real strategic weight. It usually
means the category needs educating before it can be sold to.

---

## Competitor ad data

**The point:** what competitors are actually spending money to say. Long-running ads are the only
public evidence that something works. Nobody keeps paying to run a loser.

| How | Cost | Notes |
|---|---|---|
| **Meta Ad Library** | **Free** | Public, no account needed. Every advertiser, every active ad, with run dates. |
| **TikTok Creative Center** | **Free** | Public top-performing ads by category and region. |
| **LinkedIn Ad Library** | **Free** | Public. Essential for B2B. |
| Google Ads Transparency Center | Free | Public. Search and display. |
| A scraping service | Paid | Only buys you bulk export and history. The data itself is already public. |

This class costs nothing. If someone skips competitor ad research, it is not because of access.

**Sort by run duration, not by how good the ad looks.** An ugly ad running nine months is worth
more than a beautiful one running nine days.

---

## Organic social data

**The point:** what the brand and its competitors say when they are not paying for reach, and
which of it lands.

**Where:** Instagram, TikTok, YouTube, LinkedIn, X.

Free path: open the profiles and read them. Paid path: any scraping service. Either is fine, since
this class is supporting evidence rather than load-bearing.

---

## Own performance data

**The point:** which of the brand's own creative worked, and what the winners share.

This is the brand's own data, so no tool is needed. An export from their ad account is enough. Ask for
the longest window they have, with spend, impressions, hook rate, CTR, CPA and ROAS per creative.

Most brands cannot produce this cleanly. Skip explicitly and note it. Never invent benchmarks to
fill the hole.

---

## Search & keyword data

**The point:** demand sizing and question mining. What people type when they have the problem.

Free: search autocomplete, "people also ask", related searches, and any free keyword tool.
Paid: Semrush, Ahrefs, DataForSEO and similar.

Optional throughout. Useful for sizing a segment; never the basis of one.

---

## The synthesis layer

**The point:** somewhere that holds every source at once so you can ask questions across all of
them. Where sources agree, where they contradict each other, and what nobody is saying at all.

**Claude is one.** Load the gathered files into the conversation or the project and query across
them. For most runs this is enough and needs nothing extra.

**Dedicated tools** such as NotebookLM help when the corpus outgrows a single context
window, or when you want a durable, citable notebook the brand can keep.

What matters is not the tool. It is that synthesis happens *across* sources rather than
per-source. Findings that appear in reviews and forums and competitor ads are strong. Findings
that appear in one place are hypotheses.

---

## Running it with nothing but a browser

Entirely possible. Roughly a day of work per brand:

1. Read the brand's reviews. Copy fifty into a file, spread across ratings rather than only the angry ones.
2. Do the same for two or three competitors.
3. Search `site:reddit.com "[the problem]"` and paste the best threads.
4. Open Meta Ad Library, filter to ads running 90+ days, screenshot or transcribe them.
5. Ask the brand for whatever performance data they have.
6. Hand all of it to Claude and run the pipeline.

That produces a genuinely useful brief. It will be thinner than an automated run, with fewer
sources, less coverage and more gaps to declare, but the method is identical. Thin real data still
beats rich assumptions.

---

## What paid tooling actually buys

Not access. Access to nearly all of this is free and public.

It buys **volume** (thousands of reviews instead of fifty), **repeatability** (the same pull
monthly without human effort), and **coverage** (eleven competitors instead of three).

That difference matters at agency scale, where the same pipeline runs across many brands every
month. For one brand, once, the browser path gets you most of the way.
