# Setup Checklist

1) CODEOWNERS: set real owners in .github/CODEOWNERS
2) Branch protection (main): require PR, 1–2 reviews, status checks
3) Secrets: define ACTIONS_DEPLOY_KEY (if needed), CODEQL setup
4) Enable GitHub Advanced Security (optional) for CodeQL/secret scanning
5) Environments: staging/prod (required reviewers)
6) Project board: enable GitHub Projects for backlog
7) Update org/repo in workflows if needed
