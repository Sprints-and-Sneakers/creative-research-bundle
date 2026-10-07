# Creative Research Bundle

**By [Sprints & Sneakers](https://sprintsandsneakers.com)**

Seven skills for Claude that turn raw market data into a creative brief, an audience blueprint and a ranked angle bank.

Works in the Claude app, Claude Code, and the Claude API. No coding required.

> **New to this? Read [HOW-TO.md](HOW-TO.md).** It walks you through everything step by step.
>
> **Wondering what data you need? Read [CONNECTIONS.md](CONNECTIONS.md).** That is the important one.

This is the research half of the pipeline. The copy half lives in the **[Creative Copywriting Bundle](https://github.com/Sprints-and-Sneakers/creative-copywriting-bundle)**. Run this one first, then hand its output to that one.

---

## What makes this different

Ask any model to research a market and it will hand back something plausible. The problem is that plausible and true look identical on the page, and you usually cannot tell which one you got.

This pipeline is built to make that difference visible. Every stage checks its own output before the next one runs, so a thin stage gets flagged and retried rather than passed quietly downstream where the damage becomes untraceable. Every angle carries a link back to the review, thread or ad it came from, and anything that cannot be traced gets marked speculative instead of dressed up as a finding.

It also names its gaps. When a source turns up empty the brief says so, because "nobody is discussing this publicly" is genuinely useful information. It usually means the category needs educating rather than persuading. A brief that stays silent about what it could not find reads as coverage that was never actually there.

---

## Install

### Claude app (browser or desktop)

Requires a Pro, Max, Team, or Enterprise plan with file creation enabled.

Download this repo, then upload each zip from the `dist/` folder via **Settings → Features → Skills**. Upload them as-is; do not unzip them first.

### Claude Code

```
/plugin marketplace add Sprints-and-Sneakers/creative-research-bundle
/plugin install creative-research
```

Or copy the folders manually:

```bash
cp -R skills/* .claude/skills/
```

Restart Claude Code afterwards.

### Claude API

Upload each skill through the `/v1/skills` endpoints with the `skills-2025-10-02` beta header, then reference the returned `skill_id` in the `container` parameter alongside the code execution tool.

> Skills do not sync between surfaces. Install them wherever you plan to work.

---

## The skills

| Skill | What it does |
|---|---|
| `research-director` | Runs the whole pipeline: intake, dispatch, gate checks between stages, and the compiled brief. Start here. |
| `customer-intelligence` | Reviews, forums and communities, unprompted customer language, organic audience mining. |
| `market-intelligence` | Competitor ads across three tiers (direct, indirect, audience-overlap), plus their organic content and the gap analysis. |
| `performance-analyst` | The brand's own historical ad data. Winner DNA, anti-patterns, benchmarks. Skipped explicitly when no data exists. |
| `deep-researcher` | Cross-source synthesis. Builds the VOC dictionary and the competitive gap matrix, and finds what the sources disagree about. |
| `blueprint-builder` | Audience segments, 9-point ICP profiles, awareness-level mapping, humanized personas. Loops to strengthen weak segments. |
| `angle-architect` | The angle bank. Evidence-linked, 40/40/20 split, stress-tested, ranked, strongest flagged. |

`research-director` orchestrates the rest. In Claude Code it dispatches them concurrently; in the Claude app it walks you through the identical sequence one stage at a time. Same gates either way.

## The sequence

```
intake  →  ┌ customer-intelligence ┐
           │ market-intelligence   │ →  gate  →  deep-researcher  →  blueprint-builder  →  angle-architect  →  brief
           └ performance-analyst   ┘
```

The first three are independent and can run together. Everything after that is sequential, because each stage consumes the one before it, with a gate check in between.

## Output

Plain markdown under `output/{brand-slug}/01-research/`:

```
output/{brand-slug}/01-research/
├── creative-brief.md        the compiled 17-section brief
├── voc-dictionary.md        customer language, 8 categories
├── audience-segments.md     segments, ICPs, personas, awareness mapping
├── angle-bank.md            every angle scored, ranked, evidence-linked
├── gap-matrix.md            what customers want vs what competitors say
├── review-analysis.md
├── forums-analysis.md
├── competitor-ads.md
└── research-sources.md      every source with a credibility rating
```

---

## Scope is yours to set

This bundle deliberately does not tell you to gather 200 reviews, or analyse 11 competitors, or produce 50 angles. Those are agency service levels, not method.

The structure is fixed: three competitor tiers, the 40/40/20 angle split, eight VOC categories, nine ICP attributes, and a gate between every stage. The volume is yours. Gather what you can actually reach, then say plainly in the brief what you covered and what you did not.

A brief built on fifty real reviews with the gaps named is more useful than one built on two thousand with the gaps hidden.

---

## What you need

Claude, and some way to get data. Almost none of it requires a paid API. Meta Ad Library, TikTok Creative Center and the LinkedIn Ad Library are free public tools, Reddit is publicly readable, and the brand already owns its own reviews and performance data.

[CONNECTIONS.md](CONNECTIONS.md) maps every data class to the free path, the paid path, and what degrades if you skip it. It also has a browser-only walkthrough that needs no tooling at all.

Paid scraping buys volume and repeatability. It does not buy access.

---

## Credits

Built by **[Sprints & Sneakers](https://sprintsandsneakers.com)**, a performance creative and growth unit. This is the research pipeline we run on client work, packaged so you can run it yourself.

Running it at real depth is what we do as a service: full review corpora across every competitor, complete ad-library analysis, and refreshes month over month. If you would rather have it done properly for your brand, talk to us.

© Sprints & Sneakers.

Released under the [MIT License](LICENSE).
