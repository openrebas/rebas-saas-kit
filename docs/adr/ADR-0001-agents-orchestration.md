# ADR-0001 — Agents Orchestration Plan (OpenClaw)

Status: Draft
Date: 2026-02-28
Owner: REBAS 🧭

## Context
We are building two SaaS products (OVOS, Vilo) with an agentic workflow. We need a clear, lightweight plan for agent roles, handoffs, guardrails, and CI hooks so work flows PO → UX → DEV → Review with governance and automation.

## Decision (Short)
- Define a compact agent team with crisp responsibilities and interfaces.
- Standardize the orchestration pipeline (PO → UX → DEV → AI → QA → Ops) with typed handoff artifacts.
- Enforce governance (observer) and quality gates via CI hooks that start soft and flip to hard after first real code on main.

## Agents & Responsibilities
- Strategic
  - Massi (Owner/Vision): sets direction, approves milestones.
  - REBAS (Strategy): roadmaps, ADRs, specs, priorities.
  - observer (Governance): policy checks, RBAC, guardrails, approvals.
- Operative
  - fury (Operations): sprint orchestration, ticket flow, dependencies, cadence.
- Execution / Experts
  - Elliot (Architecture): system/DFDs, NFRs, risk analysis, platform choices.
  - Dan (Engineering): code structure, APIs, impl plan, build logic.
  - Ivy (Design/UX): flows, states, wireframes, interaction patterns.
- Support
  - AI-Agent: model prompts/pipelines, retrieval/context, eval strategy.
  - QA-Agent: test plans, edge cases, security checks.
  - Ops-Agent: deployment, versioning, monitoring, incident runbooks.

## Interfaces (Typed Handoffs)
- PO Spec (PO-SPEC.md): goals, scope, acceptance criteria, KPI.
- UX Package (UX-PKG/): flows, wireframes, states, edge-cases list, content.
- Architecture Note (ARCH-NOTE.md): context, DFDs, NFRs, risks, decisions.
- Dev Plan (DEV-PLAN.md): API contracts, module boundaries, tasks, estimates.
- AI Plan (AI-PLAN.md): model(s), prompts, context sources, eval metrics.
- Test Plan (TEST-PLAN.md): scenarios, negative/abuse cases, perf/security.
- Ops Sheet (OPS.md): envs, secrets, deployments, SLOs, dashboards.

Each artifact must be:
- Minimal (1–3 pages), diffable, and link back to ADRs.
- Have an owner + status + checklist.

## Orchestration Flow (Happy Path)
1) REBAS drafts PO-SPEC + ADR(s), aligns with Massi.
2) Ivy produces UX-PKG from PO-SPEC; reviews with REBAS.
3) Elliot writes ARCH-NOTE; risks + NFRs validated by observer.
4) Dan creates DEV-PLAN + API schema; aligns with ARCH-NOTE.
5) AI-Agent drafts AI-PLAN (if applicable) + eval methods.
6) QA-Agent composes TEST-PLAN (functional + security + perf).
7) fury splits into sprint tickets; kicks off build → test → review.
8) observer enforces guardrails at PR/release; Ops-Agent preps OPS.

## Guardrails & Governance (observer)
- Two-agent rule for risky changes (security, data flows, authz).
- Policy checks: PII handling, secrets hygiene, dependency health.
- RBAC: who can merge to main; required reviewers for staging/prod.
- ADR discipline: decisions recorded, linked in PR description.

## CI Hooks (start soft → flip hard)
- Pre-merge (soft initially):
  - CodeQL (static analysis)
  - Gitleaks (secret scanning)
  - Dependency Review (supply chain risk)
- Flip-to-hard criteria: first real code merged to main.
- Post-merge: changelog, docs lints, preview env deploy.
- Branch protection (post-flip): mark CodeQL, Gitleaks, Dependency Review as Required Checks on main; staging/prod require reviewers.
- Automation: GitHub workflow/script toggles protections after the first code merge (detect via diff size/file patterns).

## Risks & Mitigations
- Overhead from artifacts → keep each to 1–3 pages and template them.
- Fuzzy ownership → owner must be named per artifact and PR.
- Security drift → observer + CI hard gates after flip.

## MVP Scope (v1)
- Templates for all artifacts with checklists.
- Single repo flow with labels mapping to artifacts and agent owners.
- CI soft gates wired; flip script stubbed.

## Sprint 1 Targets (1–2 weeks)
- Deliver: ADR-0001 (this), PO-SPEC template, UX-PKG template, ARCH-NOTE template, DEV-PLAN template.
- Wire: CI soft checks (CodeQL, Gitleaks, Dependency Review) + flip stub.
- Define: required reviewer rules for staging/prod; document in OPS.md.

## Open Questions
- What’s the minimal eval harness for AI features we accept in v1?
- Do we split repos per product (OVOS/Vilo) or start monorepo and extract later?

## Success Criteria
- PRs reference exactly one primary artifact; observer check passes.
- CI flip triggers automatically on first real code; required checks enforced thereafter.
- Cycle time from PO-SPEC to merged MVP feature ≤ 10 days.
