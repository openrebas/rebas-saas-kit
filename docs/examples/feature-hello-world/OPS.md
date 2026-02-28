# OPS — Hello World Onboarding

Owner: Ops-Agent | Status: Draft | Links: DEV-PLAN

## Environments
- dev: auto-deploy preview per PR
- staging/prod: protected; require reviewer

## Deploy
- FE: static host; BE: container with /projects/sample stub

## Monitoring
- Basic 200/5xx, latency, error rate on POST /projects/sample
