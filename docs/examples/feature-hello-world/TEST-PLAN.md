# TEST-PLAN — Hello World Onboarding

Owner: QA-Agent | Status: Draft | Links: DEV-PLAN

## Scenarios
- First visit shows greeting
- Success path creates sample project and routes to dashboard
- Error path shows retry CTA

## Security
- No secrets in client logs; backend validates auth

## Performance
- POST /projects/sample P95 < 300ms @ 50 RPS (stub ok for MVP)
