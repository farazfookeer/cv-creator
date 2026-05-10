# ATS rules — formatting + keyword strategy

Used in **ats-optimize mode** and as a final pass during **create mode**.

## What an ATS actually does

Applicant Tracking Systems (Workday, Greenhouse, Lever, iCIMS, Taleo, Bullhorn, etc.) parse your CV into structured fields (Name, Contact, Experience, Education, Skills) and run keyword matches against the job description. Most also score the result. Some companies auto-reject below a threshold; others use the score as a sorting hint for human reviewers.

The CV doesn't need to "beat" ATS — it needs to **be parseable** and **mention the right terms in context**. Tricks (white-text keyword stuffing, fake fonts) get you flagged or rejected.

## Format rules

### Safe

- **Single-column layout.** Two-column CVs are the #1 cause of mangled ATS parses.
- **Standard section headings** — "Experience," "Education," "Skills," "Certifications." Parsers look for these literal strings; don't get cute ("My Story," "Where I've Been").
- **Reverse-chronological** structure. Functional CVs confuse parsers (and most recruiters).
- **Standard fonts** — Arial, Calibri, Helvetica, Times New Roman, Garamond, Georgia. No display fonts, no script.
- **Plain bullets** — `•` or `-`. Avoid emoji or wingding bullets.
- **Real text.** All content must be selectable text, not embedded images of text.
- **PDF (text-based) or DOCX.** Both are fine. Avoid PDFs created by image-flattening or scanning.

### Hazards

- **Tables** — many parsers skip table content or read it column-by-column when you need row-by-row. Use plain paragraph layouts where possible. (Exception: Lebenslauf-tabellarisch, where the format is the convention; just expect more parser failures and submit a Markdown/text version too if asked.)
- **Headers and footers** — Microsoft Word's header/footer regions are routinely dropped. Never put your contact info there.
- **Text boxes** — same problem as headers; often skipped entirely.
- **Columns** — multi-column layouts are read in unpredictable order.
- **Graphics, icons, charts** — invisible to parsers. A bar chart of "skill level" is decorative only.
- **Photos** — fine for human reviewers in regions that expect them (DE, UAE) but ATS systems will skip them. Don't put text *over* the photo.
- **Custom characters** — fancy bullets, em-dashes in odd places, smart quotes copy-pasted from Word can all corrupt the parse on older systems.

### File naming

- Pattern: `firstname-lastname-cv-2026.pdf` or `firstname-lastname-cv-{role}.pdf`.
- Avoid: spaces, special characters, version numbers, "FINAL_v3_revised."

## Keyword strategy

### How to extract from a JD

1. **Required vs. preferred** — note both. "Required: Python, SQL, AWS" vs. "Nice to have: dbt, Snowflake."
2. **Recurring vocabulary** — terms appearing 2+ times across the JD often signal what the team values most.
3. **Acronyms + spellouts** — list both ("CI/CD" *and* "continuous integration / continuous deployment") because parsers don't synonymize.
4. **Tools and platforms** — exact spelling matches matter ("Postgres" vs. "PostgreSQL," "JavaScript" vs. "JS," "React.js" vs. "ReactJS"). Mirror the JD's spelling when honest to do so.
5. **Soft-skill phrases** — sometimes graded ("cross-functional collaboration," "stakeholder management"); include if you can back them up in a bullet.

### How to weave them in

- **In context, not as a list dump.** "Built a REST API in Python and FastAPI on AWS Lambda" beats a "Skills: Python, FastAPI, AWS, Lambda" line dump for both parsers and humans.
- **In your Skills section** for the parser to pick up cleanly, *and* in your Experience bullets in real context for the human reviewer.
- **Section order matters.** Many ATS systems weight earlier mentions higher. Move the highest-value terms (e.g., the role title from the JD) into the top third of the CV.
- **Title alignment.** If the JD says "Senior Backend Engineer" and your title is "Senior Software Engineer (Backend Systems)," rewrite to "Senior Backend Engineer" if it's honest. Recruiter screens often filter on title.

### What NOT to do

- **No invisible text** (white font, font-size 1, off-page positioning). Modern ATS flags this.
- **No keyword stuffing** in unrelated sections. "Hobbies: Python, Java, Kubernetes" is comical and counterproductive.
- **Don't claim skills you don't have** to game the parser. The interview will catch it.
- **Don't lift JD sentences verbatim.** Parsers can flag duplicate text; recruiters notice.

## ATS-optimize mode workflow

When the user provides a JD + their CV:

1. **Extract** required, preferred, recurring terms from the JD.
2. **Diff** against the CV. Mark:
   - **Missing keywords** the user could legitimately add (skills they have but didn't mention)
   - **Mis-emphasized** terms (skill mentioned in the last bullet but it's the JD's #1 requirement → move up)
   - **Format hazards** that block ATS parsing (columns, tables, headers, photo-with-text)
3. **Propose specific edits** with before/after, not vague advice ("add Python" → "Add 'Python' to Skills section under 'Languages,' AND update bullet 2 of [Role X] to read: '...').
4. **Do not invent.** If a JD requires a skill the user doesn't have, flag the gap honestly. They decide whether to address in a cover letter, learn the skill, or move on.

## Common ATS parsers (anecdotal behavior)

| ATS | Notes |
|---|---|
| **Workday** | Strict on section names; parses tables poorly. Standard headings essential. |
| **Greenhouse** | Better than most; tolerates some formatting. Still: single-column wins. |
| **Lever** | Forgiving but inconsistent on PDFs with custom fonts. |
| **iCIMS** | Heavy on keyword scoring. Mirror JD vocabulary closely. |
| **Taleo** | Older parsers in some deployments; play it very safe (Times New Roman, no tables). |

When unsure, default to **maximum conservatism** for the ATS-screened submission and keep a designed version separately for direct outreach.
