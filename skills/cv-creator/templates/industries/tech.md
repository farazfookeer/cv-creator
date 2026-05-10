# Tech / software industry overlay

Apply on top of any region template.

## Section emphasis

- **Technical Skills** — promote to a top section (after Summary, before or alongside Experience). Group: Languages, Frameworks, Infrastructure/Cloud, Databases, Tools.
- **Projects** — include if entry-level, open-source contributor, or career changer. Senior engineers usually fold notable projects into Experience bullets.
- **GitHub / portfolio** — link in header.
- **Certifications** — only the meaningful ones (AWS Solutions Architect, GCP Professional, CKA, etc.). Skip generic LinkedIn Learning badges.

## Must-haves by seniority

| Seniority | Emphasize |
|---|---|
| Entry | Projects, internships, hackathons, open-source PRs, GPA if ≥3.5 |
| Mid | Production impact (latency, throughput, uptime, cost), team size influenced |
| Senior | System design, cross-team initiatives, mentoring, hiring contribution |
| Staff+ | Strategic technical bets, multi-org influence, public artifacts (talks, RFCs, OSS maintainership) |

## Bullet patterns (good vs. bad)

❌ "Worked on the backend team using Java and Spring."
✅ "Cut p99 checkout latency 480ms → 110ms by replacing N+1 ORM calls with a batched DataLoader, unblocking a 3% conversion lift the data team had attributed to mobile."

❌ "Used AWS to scale the system."
✅ "Designed an EKS-based blue/green deploy that took rollback time from 12 minutes to 30 seconds; eliminated 4 of 6 P1 incidents in Q3."

❌ "Helped onboard new engineers."
✅ "Authored the team's onboarding runbook and ran weekly office hours; reduced first-PR-merged time from 11 days to 4 across 8 hires."

## Skills section template

```markdown
## Technical Skills

**Languages** — {{Python, TypeScript, Go, Rust, ...}}
**Frameworks** — {{React, Next.js, Django, FastAPI, ...}}
**Infrastructure** — {{AWS (EKS, RDS, Lambda), Terraform, Docker, Kubernetes}}
**Data** — {{Postgres, Redis, Kafka, ClickHouse, dbt, Airflow}}
**Practices** — {{CI/CD, observability (OTel, Datadog), incident response, RFC authorship}}
```

Order skills by *what you actually use day-to-day*, not alphabetically. Drop anything you couldn't pass an interview question on — false skills get caught and burn credibility.

## Tech-specific gotchas

- **Buzzword soup hurts you** at strong engineering employers. "Hands-on with microservices, AI/ML, blockchain, IoT" reads as bullshit. List 5 things you're deep on, not 25 you've heard of.
- **Open source is currency.** A meaningful GitHub graph or maintained project beats a long Skills list.
- **Recency matters** — list "Python (current)" vs. "Perl (last used 2014)" honestly; senior engineers know the half-life.
- **Don't list "Microsoft Office" or "Slack."** Default tools aren't skills.
- **For ATS-screened roles:** mirror the JD's exact spellings ("React.js" vs "ReactJS" vs "React"; "Postgres" vs "PostgreSQL"). The parser doesn't synonymize.
