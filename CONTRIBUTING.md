# Contributing to cv-creator

Thanks for considering a contribution. This skill aims to be the most useful, regionally-honest CV/résumé generator available — that only happens with input from people who actually hire and apply across these regions and industries.

## What's most valuable

In rough priority order:

1. **A new region archetype** — Japanese rirekisho, Chinese 简历, India-specific, Australia, Brazil, Nordic, etc. See "Adding a region" below.
2. **A new industry overlay** — legal, government/civil service, education K–12, hospitality, agriculture, journalism, etc. See "Adding an industry" below.
3. **Real-world example CVs** — anonymized, fully-filled-in samples in `skills/cv-creator/examples/`. The more the better; they double as templates for users to read directly.
4. **Region-norm corrections** — if you're closer to a market than the current author and we got something wrong, please open a PR or issue. Specifics: photo conventions, length expectations, what hiring managers actually screen on.
5. **ATS rule updates** — parser behavior changes; documented evidence (e.g., "Workday 2025 update parses two-column PDFs correctly") is welcome.

## What we don't want

- Generic "I added a buzzword" PRs — every change should be testable against real-world hiring practice.
- Untested templates — every template addition should ship with at least one example CV that exercises it.
- Removing the honesty rules. The skill must never invent metrics, employers, or credentials.

## Adding a region

Each region template must answer the following questions in the body or header:

- **Length** — typical and acceptable range
- **Photo** — yes / no / optional, with hiring-context notes
- **Personal details** — DOB, marital, nationality, address — what's expected and what's discriminatory
- **Date format** — local convention
- **Section order** — defaults
- **Region-specific gotchas** — things a non-local would get wrong

Then:
1. Create `skills/cv-creator/templates/regions/<region>.md` following the existing format (use `us.md` or `uae.md` as a starting structure).
2. Add a row to the at-a-glance matrix in `skills/cv-creator/reference/region-norms.md`.
3. Add a "Per-region detail" subsection in the same file.
4. Add an example CV in `skills/cv-creator/examples/` exercising the new region.
5. Update the region table in the root `README.md`.

## Adding an industry

Each industry overlay must include:

- **Section emphasis** — what gets promoted/demoted vs. the region default
- **Must-haves by seniority or sub-vertical**
- **Bullet patterns** — at least 3 before/after examples specific to the industry
- **Industry-specific gotchas** — credentials, jargon norms, screening signals

Then:
1. Create `skills/cv-creator/templates/industries/<industry>.md` (use `nursing.md` or `tech.md` as a structural model).
2. Update the industry list in `README.md`.
3. Optionally add a region × industry example CV.

## Code & content style

- Markdown source. No HTML embedded unless absolutely necessary.
- Tables for tabular data, plain prose otherwise.
- Concrete > vague. Numbers > adjectives. Examples > abstractions.
- One short line of comment max in scripts; the code should explain itself.

## Pull request checklist

- [ ] New template includes the section structure documented above
- [ ] At least one example CV exercises the new region/industry
- [ ] `README.md` updated if coverage table changed
- [ ] `region-norms.md` updated if a new region was added
- [ ] No invented metrics or credentials in examples — anonymize real data; fictional names are fine
- [ ] Ran the build pipeline locally if your change touches scripts/styles: `bash skills/cv-creator/scripts/check-deps.sh && bash skills/cv-creator/scripts/build.sh skills/cv-creator/examples/<your-example>.md`

## Reporting issues

The most useful issues are:

- **"This region's photo norm has changed"** with a link to a hiring-org policy or an authoritative source.
- **"This ATS now handles X correctly"** with a reproduction.
- **"This bullet pattern doesn't translate well to <region>"** with a concrete suggestion.

Avoid issues that are abstract style preferences without grounding in hiring outcomes.

## Code of conduct

Be respectful. Focus on the work, not the person. The goal is to help people get jobs.

## License

All contributions are accepted under the same MIT license that covers the project. By submitting a PR, you agree to license your contribution under those terms.
