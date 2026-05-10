# Review-mode critique checklist

Used in **review mode** to score an existing CV. Walk top to bottom; produce a prioritized punch list (must-fix → should-fix → nice-to-have) under 200 words by default.

## 1. Region match

- [ ] Does the format match the target region? (See `region-norms.md`.)
- [ ] Length within the regional norm? (US 1pg, UK/EU 2pg, DE 1–2pg tabular, UAE 2–3pg, academic 4–10+pg)
- [ ] Photo present/absent appropriate to region? (No US/UK; yes DE/UAE; no academic.)
- [ ] Personal details (DOB, marital, nationality) appropriate to region?
- [ ] Date format consistent and region-appropriate?

## 2. Structure

- [ ] Standard section headings ("Experience," "Education," "Skills") used? (ATS-critical.)
- [ ] Reverse-chronological within each section?
- [ ] Section *order* matches regional/industry expectations? (e.g., licenses-up for nursing, certifications-up for finance)
- [ ] Header has name, location, contact, LinkedIn? Nothing in headers/footers?
- [ ] No gaps unexplained? (Especially for German Lebenslauf.)

## 3. Bullet quality

For each role, sample 3–5 bullets and check:
- [ ] Action verb + quantified result + impact? (See `bullet-rubric.md`.)
- [ ] No "responsible for" / "helped" / "worked on" openers?
- [ ] No stacked adjectives ("dynamic, results-driven, innovative")?
- [ ] Acronyms spelled out on first use?
- [ ] Numbers feel honest (not suspiciously precise; not borrowing team-wide credit)?

## 4. ATS hazards

- [ ] Single-column layout? (Tables/columns/text boxes are red flags.)
- [ ] Standard fonts? No images-of-text?
- [ ] Bullets are real text characters, not graphics?
- [ ] No headers/footers carrying critical info?
- [ ] No keyword stuffing in unrelated sections?
- [ ] Filename sensible (`firstname-lastname-cv.pdf`)?

## 5. Consistency

- [ ] Tense — past for past roles, present for current?
- [ ] Capitalization consistent across job titles, school names, technologies?
- [ ] Date format consistent across all roles?
- [ ] Bullet punctuation consistent (all periods or none)?
- [ ] Spacing / alignment uniform?

## 6. Industry-specific

Pull the relevant `templates/industries/<industry>.md` and check:
- [ ] Required certifications/licenses listed and current?
- [ ] Industry-required metrics surfaced? (Quota for sales, AUM for finance, patient ratios for nursing, etc.)
- [ ] Section emphasis aligned with industry norms?
- [ ] Tools/skills relevant to the industry, not stale or generic?

## 7. Honesty signals

- [ ] No invented metrics or credentials?
- [ ] Tenure-stitching honest? (Short roles explained or contextualized; gaps acknowledged in regions where required.)
- [ ] Authorship/ownership claims fair? ("Led" vs "contributed to" used accurately.)
- [ ] LinkedIn matches the CV? (Mismatches get flagged in reference checks.)

## Output format

Default to a punch list, prioritized:

```
**Must fix**
1. {{Highest-impact issue}} — {{specific suggestion}}
2. ...

**Should fix**
1. ...

**Nice to have**
1. ...
```

Keep the whole review under 200 words unless the user requests more. Concrete > vague: instead of "tighten your bullets," quote the bullet and rewrite it.
