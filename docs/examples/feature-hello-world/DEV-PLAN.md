# DEV-PLAN — Hello World Onboarding

Owner: Dan | Status: Draft | Links: ARCH-NOTE, UX-PKG

## API Contracts
- POST /projects/sample → 201 { id, name }

## Modules
- ui/welcome, ui/dashboard, core/projects, api/client

## Tasks & Estimates
- [ ] WelcomeView + route — 0.5d — FE
- [ ] Button → action + toast — 0.5d — FE
- [ ] Backend endpoint + scaffolder — 1d — BE

## Testing
- Unit: action success/failure
- E2E: create-sample -> lands on dashboard
