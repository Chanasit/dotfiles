# AGENTS.md

# Codex Agent Instructions + Permanent Context

## RTK Integration (Rust Token Killer)
@RTK.md

## RTK Guidelines for Codex
- The assistant MUST use `rtk <command>` for all terminal interactions to maintain low token usage.
- Prefer summarized outputs for infrastructure tools (Terraform, Kubernetes, Docker, etc.).
- When full raw output is required, explicitly use `rtk proxy <command>`.
- Always monitor token efficiency with `rtk gain`.
- For large code changes or PR reviews, use `rtk git diff` or `rtk git show`.

## DevOps Engineer Best Practices
- When reviewing infrastructure changes: Use `rtk terraform plan`, `rtk git diff`, etc.
- For cluster inspection: `rtk kubectl get all --all-namespaces`
- For debugging: Start with filtered `rtk` version, escalate to `rtk proxy` only if necessary.
- Maintain clean context by avoiding unnecessary large command outputs.

## General Codex Workflow
- Think step-by-step.
- Use tools via rtk when running shell commands.
- Keep responses focused and actionable for DevOps tasks.

This file is auto-included in every Codex session.
