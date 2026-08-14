# How to use this

A step-by-step guide. No experience needed. Read it top to bottom.

---

## 1. What is this?

Before you can write good ads, you need to know what your customers actually think and say. Most people skip this and guess. Their ads then sound like every other ad.

This bundle does that research properly. It reads what your customers write, looks at what your competitors are running, finds the gaps, and hands you a document you can write ads from.

A **skill** is a set of instructions you give Claude once. After that Claude follows them whenever they are relevant. This bundle has **7 skills** that work as a team.

You will not write any code. You will download some files, click some buttons, and then talk to Claude in normal sentences.

---

## 2. What you need

**A Claude account.**
- Using Claude in a browser or the desktop app? You need a paid plan (Pro, Max, Team, or Enterprise) with file creation switched on. Free plans cannot add skills.
- Using Claude Code? Any plan that includes it.

**Some data about your market.** This is the part that matters, and section 7 explains it. The short version: you do not need to buy anything.

---

## 3. Get the files

Go to the top of this page. Click the green **Code** button, then **Download ZIP**.

The file lands in Downloads. Double-click it to open it.

Inside is a folder called **dist** with 7 small zip files, one per skill. You will need those next.

---

## 4a. Install in the Claude app (browser or desktop)

Repeat this 7 times, once per skill. About a minute each.

1. Open Claude.
2. Click your name or picture in the bottom left.
3. Click **Settings**.
4. Click **Features**.
5. Find the Skills section. Click to add or upload a skill.
6. Pick one zip from the **dist** folder. Start with `research-director.zip`.
7. Wait for it to appear in the list.
8. Go back to step 5 with the next zip.

**Do not unzip the files in the dist folder.** Upload them exactly as they are.

---

## 4b. Install in Claude Code

Type this, press enter:

```
/plugin marketplace add Sprints-and-Sneakers/creative-research-bundle
```

Then this:

```
/plugin install creative-research
```

Close Claude Code and open it again.

---

## 5. Check it worked

Ask Claude:

> What skills do you have?

You should see names like `research-director` and `customer-intelligence`. If not, jump to section 9.

---

## 6. How to use it

Start a new chat and say:

> Run the creative research pipeline for my brand.

Claude will take it from there. It asks you questions first, then works through the stages in order.

**It will ask you for things.** Competitor names, your website, where your reviews are, whether you have past ad data. Answer as best you can. If you do not know something, just say so. The pipeline is built to handle gaps and will note them rather than invent an answer.

**It will stop and check itself.** After each stage there is a gate: did this produce enough? If not, it retries or tells you what is missing. That is the pipeline working, not failing.

**It takes a while.** This is real research, not a one-shot answer. Expect several rounds of back and forth. In the Claude app it works one stage per message.

You can also run a single piece on its own:

> Just analyse my competitors' ads.

---

## 7. The part that actually matters

Read this bit twice.

This pipeline studies real data about real customers. If you give it nothing, it has nothing to study, and it will tell you so rather than make things up.

**The good news: you do not need to buy anything.**

- **Your reviews.** You already have these. Trustpilot, Google, Amazon, your app store page, your inbox.
- **Competitor ads.** The Meta Ad Library is free and public, as are TikTok Creative Center and the LinkedIn Ad Library. Anyone can see every ad any company is running right now, with the date each one started.
- **What people say online.** Reddit is publicly readable. Search `site:reddit.com "your problem"` in Google.
- **Your own ad results.** If you have run ads before, export the numbers.

Copy and paste is a completely legitimate way to do this. Fifty real customer reviews pasted into a chat will get you further than any amount of clever prompting.

**[CONNECTIONS.md](CONNECTIONS.md) has a full walkthrough** of doing this with nothing but a web browser. It takes about a day and it works.

Paid scraping tools speed this up. They do not unlock anything you cannot already reach.

---

## 8. What you get at the end

Files in a folder called `output`, organised like this:

```
output/
  your-brand-name/
    01-research/
      creative-brief.md       ← the main document, read this one
      voc-dictionary.md       ← your customers' actual words
      audience-segments.md    ← who you are selling to
      angle-bank.md           ← things you could say, ranked
      gap-matrix.md           ← what nobody else is saying
```

In Claude Code these appear as real files. In the Claude app, ask Claude to show them or give you a download.

**Then what?** Hand these to the [Creative Copywriting Bundle](https://github.com/Sprints-and-Sneakers/creative-copywriting-bundle) and it writes the ads.

---

## 9. When something goes wrong

**The skills do not show up.**
Close Claude completely and reopen. In the app, check Settings and Features. In Claude Code, make sure you restarted.

**It says I cannot upload skills.**
You are probably on a Free plan, or file creation is off. Skills need a paid plan.

**It keeps asking me for data I do not have.**
Say so. "I don't have review data" is a valid answer. It will note the gap and work with what it has. It will also tell you how much weaker the result is, which is the pipeline being honest with you rather than breaking.

**It says a stage failed the gate.**
That is the safety net. Something came back too thin. Read what it says is missing and either supply more or tell it to proceed and record the gap.

**It is taking forever.**
It is meant to. This replaces about a week of manual work. If you want something fast, run one skill instead of the whole pipeline.

**I want to start over.**
Open a brand new chat. Old chats carry old context.

---

## Still stuck?

Doing this at full depth is what we do as a service: every competitor, complete review corpora, refreshed monthly.

If you would rather have it done for you, come talk to us at [sprintsandsneakers.com](https://sprintsandsneakers.com).
