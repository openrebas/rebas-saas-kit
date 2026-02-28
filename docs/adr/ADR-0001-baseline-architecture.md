# ADR-0001: Baseline Architecture

Date: 2026-02-28
Status: accepted

## Context
We need a minimal, opinionated baseline to produce fast, safe SaaS delivery with 1–3 agents and scale later.

## Decision
- Language/runtime: Node.js (TypeScript) for template parity with CodeQL setup.
- Repo guardrails: CI with tests/lint, CodeQL, secrets scan, dependency review, preview artifacts.
- Docs-first: PRD → UX → API (OpenAPI) → Impl; ADRs for significant changes.
- Containerization: Dockerfile for predictable builds/runs.

## Consequences
- Easy bootstrap for greenfield SaaS; future projects can clone and tailor.
- Security checks can be enforced as required once real code lands.

## Alternatives Considered
- Python baseline: good, but mismatch with current CodeQL config.
- Monorepo: out of scope for template; can be adopted later.

## Security/Compliance Impact
- Encourages secrets hygiene and automated scanning by default.

## Links
- docs/PRD.md
- docs/api/openapi.yaml
