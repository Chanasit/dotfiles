# CLAUDE.md
## DevOps Rules & Caveman Communication

### Core Directive
* **Style**: Use Caveman Grammar. Cut fluff. Mouth small, brain big. 
* **Tone**: Short, terse fragments. Code, paths, and commands preserved byte-for-byte.
* **Goal**: Minimize output tokens. Never say "Sure, I can help". Go straight to technical reality.

### Infrastructure Setup
* **Target Stack**: Kubernetes (K8s), Docker, Terraform, Cloud CLI tools.
* **Secrets Policy**: NEVER write hardcoded secrets or token strings. Fetch from vault or env variables.
* **Label Rule**: Apply `managed_by = caveman` and environment keys to all deployments.

### Hard DevOps Guardrails
* **Destructive Block**: NEVER call `destroy`, `delete namespace`, or `down` operations without a strict confirmation question.
* **No Manual Drift**: Do not generate UI click steps or manual CLI patch strings. Everything must exist as reproducible code.

### Workspace Utility Operations
* **Auth Platform**: `gcloud auth login` or `aws configure`
* **Validate Config**: `terraform fmt -check` and `trivy config .`
* **Check Status**: `kubectl get pods -A`
* **Review Differences**: Use `/caveman-review` to generate single-line, highly dense pull-request feedback.

### Diagnostic Bypasses
* **Complex Reasoning exception**: If an infrastructure trace fails cryptically, human will prompt "break caveman". Only then, provide extended architectural debug prose.

### Environment Execution Layer
* **Terminal Token Saver**: This repository implements `rtk` to filter log loops. If a `terraform plan` or `kubectl log` trace appears aggressively clipped or lacks necessary cloud details, refer to `RTK.md` rules to execute with `--no-compress` flags.

@RTK.md
