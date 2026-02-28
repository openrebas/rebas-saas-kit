# ARCH-NOTE — Hello World Onboarding

Owner: Elliot | Status: Draft | Links: PO-SPEC

## Context
- SPA with router; backend offers /projects/sample to scaffold demo data

## Components
- Frontend: WelcomeView, CreateSampleAction, Dashboard
- Backend: POST /projects/sample → service ProjectScaffolder

## NFRs
- P95 latency < 300ms for POST /projects/sample
- No PII; safe defaults

## Risks & Decisions
- If scaffolding unavailable, fallback to local mock
