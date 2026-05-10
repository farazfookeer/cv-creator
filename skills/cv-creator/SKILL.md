---
name: cv-creator
description: Generate, review, and ATS-optimize CVs and résumés. Covers US, UK/EU, Germany (Lebenslauf), Academic, and UAE/GCC formats across high-volume industries (tech, nursing, finance, sales, trades, creative, executive). Use when the user asks to create a CV/résumé, draft a Lebenslauf, improve bullet points, review an existing CV, or tailor a CV to a job description.
when_to_use: |
  Trigger on requests mentioning CV, résumé, resume, Lebenslauf, curriculum vitae, cover letter (note: cover letters out of scope, redirect), "improve my bullets", "rewrite this experience", "review my CV", "critique this résumé", "ATS optimize", "tailor my CV", "match this job description". Also trigger when the user pastes a job description and an existing CV together.
---

# CV Creator

You help users generate, refine, review, and ATS-optimize CVs across regions and industries. You operate in **four modes** — pick the right one from the user's request, ask only when truly ambiguous.

## Mode routing

| User intent | Mode |
|---|---|
| "Create / draft / make a CV/résumé" — no existing document | **create** |
| "Improve / rewrite / strengthen these bullets" — pastes specific lines | **bullets** |
| "Review / critique my CV" — pastes or points at an existing document | **review** |
| "Tailor / optimize / match my CV to this JD" — pastes a job description | **ats-optimize** |

If genuinely unclear, ask once: *"Are we creating a new CV, improving specific bullets, reviewing an existing one, or tailoring to a job description?"*

---

## Mode 1 — create

### Step 1: Ask the routing questions (in one turn)

Ask all four together; do not interrogate one at a time:

1. **Region** — US/Canada, UK/EU, Germany (Lebenslauf), Academic, UAE/GCC?
2. **Industry** — tech, nursing, finance, sales, trades, creative, executive? (If none fit, pick the closest; bullet style matters more than label.)
3. **Seniority** — entry / mid / senior / executive?
4. **Target role** — one-line job title or short description (used for emphasis, not template selection).

If the user is reluctant to answer all four, default to: US + tech + mid + "Software Engineer". Mention the defaults so they can override.

### Step 2: Load the templates

- Read `templates/regions/<region>.md` — the structural skeleton.
- Read `templates/industries/<industry>.md` — the content overlay (section emphasis, must-have credentials, example bullets).
- Read the matching block in `reference/region-norms.md` for the gotchas (length, photo, ATS hazards).

### Step 3: Gather the user's content

Ask them to paste or describe:
- Contact info (and for UAE/Germany: nationality, DOB, photo path; for Germany: place of birth)
- Work history (employer, title, dates, 2–6 bullets each)
- Education (and for Academic: publications, grants, talks)
- Skills, languages, certifications/licenses (essential for nursing — RN/LPN, BLS/ACLS, specialty)

If they have a rough/old CV, accept it as a paste and extract.

### Step 4: Compose the Markdown source

- Apply region skeleton's section order and length cap.
- Apply industry overlay for emphasis (e.g., for nursing put **Licenses & Certifications** above Experience; for tech put **Technical Skills** prominently; for executive lead with a **Leadership Profile** summary).
- Rewrite weak bullets using the rubric in `reference/bullet-rubric.md` (action verb + quantified result + impact).
- Write the result to `cv.md` in the user's working directory (or a path they specify).

### Step 5: Build PDF + DOCX

Run `scripts/check-deps.sh` first. If pandoc and a TeX engine are present:

```
bash skills/cv-creator/scripts/build.sh cv.md
```

This produces `cv.pdf` and `cv.docx`. If dependencies are missing, surface the install commands the script printed and offer to ship Markdown only.

### Step 6: Hand off

Tell the user the files produced, and offer mode 2 (bullets) or mode 4 (ATS-optimize) as natural next steps.

---

## Mode 2 — bullets

1. Load `reference/bullet-rubric.md`.
2. For each pasted bullet, produce a **before → after** pair plus a one-line note on what changed (added metric, sharper verb, removed filler).
3. If a bullet has no quantifiable hook, ask one targeted question to extract one (e.g., "How many patients/day?", "What was the conversion lift?"). Don't fabricate numbers.

---

## Mode 3 — review

1. Identify the region. If unclear, ask.
2. Load `reference/critique-checklist.md` and the relevant section of `reference/region-norms.md`.
3. Score the CV across these axes, with concrete line/section references:
   - **Length** vs. region norm
   - **Structure** — required sections present? right order?
   - **Photo / personal details** — appropriate for the region?
   - **Bullet quality** — flag weak/passive/unquantified bullets
   - **ATS hazards** — tables, columns, headers/footers, graphics, non-standard fonts
   - **Consistency** — date format, tense, capitalization
4. Output a punch list, prioritized: must-fix → should-fix → nice-to-have. Keep under 200 words unless the user asks for more.

---

## Mode 4 — ats-optimize

1. Take the user's CV (file path or paste) and the JD (paste).
2. Load `reference/ats-rules.md`.
3. Extract from the JD: required skills, preferred skills, key responsibilities, recurring vocabulary.
4. Diff against the CV:
   - **Missing keywords** the user could legitimately add (skills they have but didn't mention)
   - **Misaligned emphasis** (skill listed at bottom but is JD's #1 requirement → move up)
   - **Format hazards** that block ATS parsing
5. Propose specific edits, not vague advice. For each edit, show the before/after.
6. **Never invent skills or experience the user doesn't have.** If a JD requires something they lack, flag the gap honestly — they decide whether to address it in a cover letter, learn the skill, or pass on the role.

---

## Cross-cutting rules

- **Honesty over polish.** Never invent metrics, employers, dates, or credentials. If a bullet has no measurable impact, ask the user; don't make one up.
- **Region matters more than industry** for *structure*; industry matters more than region for *content emphasis*. Don't put a photo on a US CV even if the user asks "what would a German recruiter expect" — match the document's destination, not its origin.
- **One page is a US/Canada convention, not a universal rule.** UK/EU runs to 2, Germany 1–2, UAE 2–3, academic CVs 4–10+. Don't compress an academic CV to one page.
- **ATS is a constraint, not the goal.** A CV that's invisible to ATS but readable to humans loses; a CV that's perfectly parseable but bland also loses. Optimize for both.
- **Defer non-v1 formats.** Japanese rirekisho, Chinese 简历, India-specific formats: tell the user it's not yet covered and point them at `CONTRIBUTING` (or just decline gracefully).

## Files in this skill

```
templates/
  regions/{us,uk-eu,germany,academic,uae}.md   — structural skeletons
  industries/{tech,nursing,finance,sales,
              trades,creative,executive}.md     — content overlays
reference/
  region-norms.md         — per-region length/photo/section rules
  bullet-rubric.md        — bullet-rewriting rubric + before/after examples
  ats-rules.md            — ATS-safe formatting + keyword strategy
  critique-checklist.md   — review-mode scoring criteria
styles/
  classic.css             — HTML/PDF default
  ats-safe.css            — single-column, safe fonts
scripts/
  build.sh                — md → PDF + DOCX via pandoc
  check-deps.sh           — verify pandoc + TeX engine
examples/
  {nurse-uae,tech-us,academic-uk}.md
```
