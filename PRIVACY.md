# Privacy

`cv-creator` is a local Claude Code skill. It does not collect, transmit, or store any data on its own.

## What the skill does with your data

- **Reads files you provide** — CV drafts, job descriptions, notes — only when you point the skill at them.
- **Writes output files** — Markdown, PDF, and DOCX — only to paths on your local machine that you specify.
- **Calls no external services.** No analytics, no telemetry, no remote logging, no third-party APIs.

## Tools the skill invokes

| Tool | Where it runs | Network access |
|---|---|---|
| Claude (via Claude Code) | Anthropic API | Yes — your prompts go to Anthropic, governed by [Anthropic's Privacy Policy](https://www.anthropic.com/privacy) and [Usage Policy](https://www.anthropic.com/aup) |
| pandoc | Local binary | No |
| WeasyPrint *(optional, fallback PDF engine)* | Local binary | No |
| xelatex / TeX Live *(optional, primary PDF engine)* | Local binary | No |

In other words: the skill itself transmits nothing. The only outbound traffic is the Claude prompt/response flow that any Claude Code session generates regardless of which skill is active.

## Personal data in your CV

CVs typically contain personally identifying information — full name, contact details, employment history, education, sometimes date of birth, nationality, photo, or visa status (for region templates that expect them, e.g., UAE/GCC, Germany).

You control these files. The skill reads what you give it, writes what you ask, and stores nothing. After the session, the only artifacts are the files on your filesystem at the paths you chose.

If you share a generated CV with a third party (employer, recruiter, file-sharing service), normal data-handling considerations apply — that's outside the scope of this skill.

## Open-source review

The skill is fully open source. Every prompt template, every reference document, every line of script is in this repository. If you want to verify the privacy claims above, [`skills/cv-creator/`](skills/cv-creator/) and [`scripts/`](skills/cv-creator/scripts/) are the only directories that affect runtime behavior.

## Contact

Questions or concerns: open an issue at [github.com/farazfookeer/cv-creator/issues](https://github.com/farazfookeer/cv-creator/issues).

## Changes

Material changes to this policy will be committed to this file with a Git history visible in the repository.
