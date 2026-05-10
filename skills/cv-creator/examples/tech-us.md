# Jordan Chen

San Francisco, CA · 415-555-0142 · jordan.chen@example.com · linkedin.com/in/jordanchen · github.com/jordanchen

## Summary

Senior backend engineer (8 years) focused on distributed data systems and developer-facing platforms. Currently leads a 4-person team at a Series-C fintech, building the merchant-payments backend (~$3B/yr GMV). Previous roles at a public B2B SaaS and a YC-backed dev-tools startup.

## Experience

### Stripe-Adjacent Fintech (Series C) — Senior Backend Engineer
San Francisco, CA · Mar 2022 – Present

- Lead a 4-engineer team owning the merchant-payments service (Go, Postgres, Kafka, AWS EKS); the service processes ~$3B GMV/year at p99 of 80ms.
- Reduced p99 checkout latency from 480ms to 110ms by replacing N+1 ORM queries with a batched DataLoader and adding read-through caching; unblocked a 3% conversion lift the data team had previously attributed to mobile.
- Designed an EKS blue/green deploy pipeline that took rollback time from 12 minutes to 30 seconds; eliminated 4 of 6 P1 incidents in Q3 2024.
- Authored the team's incident-response runbook and drove a quarterly chaos-engineering exercise; mean time to detect (MTTD) on synthetic outages dropped 40%.
- Onboarded 6 new engineers since 2023; first-PR-merged time fell from 11 to 4 days.

### Datadog-Adjacent Public SaaS — Backend Engineer
San Francisco, CA · Jul 2019 – Feb 2022

- Built the metrics-ingestion path for a multi-tenant time-series platform (Go, ClickHouse, Kafka); scaled from 200K to 1.8M points/sec ingest with no increase in P50 latency.
- Re-architected the rollup pipeline using a deterministic late-arrival model; cut storage cost ~22% across the fleet (~$240K/year run-rate).
- Owned the service's SLOs and on-call rotation; reduced page volume by 60% year-over-year through targeted alert tuning and saturation monitoring.
- Mentored 2 junior engineers, both promoted within 18 months.

### YC Dev-Tools Startup — Software Engineer
Remote · Aug 2017 – Jun 2019

- One of the first 8 engineers; built the CLI, the GitHub integration, and core REST API (Python/FastAPI, Postgres, AWS Lambda).
- Drove the product's first GA release; the integration acquired 1,200 GitHub-org users in the first 6 months post-launch.
- Authored the public OpenAPI spec used in customer self-service onboarding.

## Education

**B.S. Computer Science**, University of California, Berkeley — 2017
GPA: 3.7 · Tau Beta Pi · Senior project: distributed key-value store with consistent hashing.

## Technical Skills

**Languages** — Go, Python, TypeScript, SQL
**Frameworks** — FastAPI, Gin, gRPC, React
**Infrastructure** — AWS (EKS, RDS, Lambda, ECS), Terraform, Docker, Kubernetes, Helm
**Data** — Postgres, ClickHouse, Kafka, Redis, dbt, Airflow
**Practices** — CI/CD, observability (OTel, Datadog), incident response, RFC authorship, on-call leadership

## Open Source

- **gjsonparse** — streaming JSON parser in Go (1.4k★, 80+ contributors). Maintainer since 2021.
- Contributor: ClickHouse, Datadog OTel collector.
