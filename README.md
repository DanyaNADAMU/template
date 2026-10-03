# Standard Project Baseline Template

This repository represents the canonical baseline structure for all projects.

## Project Structure
- `.githooks/` - Versioned Git hooks for invisible OpenTimestamps background anchoring.
- `.github/workflows/ots-cron.yml` - Daily automated proof upgrading & verification.
- `.allowed_signers` - Trusted public keys for commit verification.
- `SECURITY.md` - Security policy and trust anchoring.
- `docs/` - Living documentation (Architecture, ADR, Plans, Ideas, User Guides).
- `src/` - Application source code.
- `scripts/retrofit.sh` - Helper script to upgrade existing repositories to this baseline.

## Quickstart for New Projects
1. Copy or clone this template:
   ```bash
   cp -r /workspace/template /workspace/newproject
   cd /workspace/newproject
   git init
   git config core.hooksPath .githooks
   ```
