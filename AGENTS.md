@/Users/chanasit.ba/.codex/RTK.md

# Agent Instructions

## Shell Command Policy

- Always run shell commands through `/opt/homebrew/bin/rtk`.
- Prefer compact, high-signal commands and let `rtk` compress noisy output.
- Use `/opt/homebrew/bin/rtk git status --short` before and after edits.
- Use `/opt/homebrew/bin/rtk proxy <cmd>` only when `rtk` does not support a command form directly.
- Do not run destructive commands such as `rm`, `git reset`, or force pushes unless the user explicitly asks.

## Repo Workflow

- Check the worktree before making changes.
- Preserve user edits in dirty files.
- Use `rg` for searching and `sed -n` for focused file reads.
- Use `apply_patch` for manual edits.
- Run the smallest relevant verification command after changes.

## DevOps Command Defaults

Use these commands as the usual first pass for DevOps work. Prefix every command with `/opt/homebrew/bin/rtk`.

### Git

```bash
/opt/homebrew/bin/rtk git status --short
/opt/homebrew/bin/rtk git diff
/opt/homebrew/bin/rtk git log --oneline --decorate -20
/opt/homebrew/bin/rtk git branch --show-current
```

### Docker

```bash
/opt/homebrew/bin/rtk docker ps
/opt/homebrew/bin/rtk docker compose ps
/opt/homebrew/bin/rtk docker compose logs --tail 200
/opt/homebrew/bin/rtk docker compose config
/opt/homebrew/bin/rtk docker image ls
```

### Kubernetes

```bash
/opt/homebrew/bin/rtk kubectl config current-context
/opt/homebrew/bin/rtk kubectl get ns
/opt/homebrew/bin/rtk kubectl get pods -A
/opt/homebrew/bin/rtk kubectl get deploy,svc,ingress -A
/opt/homebrew/bin/rtk kubectl describe pod <pod> -n <namespace>
/opt/homebrew/bin/rtk kubectl logs <pod> -n <namespace> --tail 200
/opt/homebrew/bin/rtk kubectl rollout status deploy/<deployment> -n <namespace>
```

### Helm

```bash
/opt/homebrew/bin/rtk helm list -A
/opt/homebrew/bin/rtk helm status <release> -n <namespace>
/opt/homebrew/bin/rtk helm history <release> -n <namespace>
/opt/homebrew/bin/rtk helm template <release> <chart> -n <namespace>
/opt/homebrew/bin/rtk helm diff upgrade <release> <chart> -n <namespace>
```

### Terraform

```bash
/opt/homebrew/bin/rtk terraform fmt -check -recursive
/opt/homebrew/bin/rtk terraform init
/opt/homebrew/bin/rtk terraform validate
/opt/homebrew/bin/rtk terraform plan
/opt/homebrew/bin/rtk terraform show
/opt/homebrew/bin/rtk terraform state list
```

### Terragrunt and Terramate

```bash
/opt/homebrew/bin/rtk terragrunt hclfmt --terragrunt-check
/opt/homebrew/bin/rtk terragrunt run-all validate
/opt/homebrew/bin/rtk terragrunt run-all plan
/opt/homebrew/bin/rtk terramate fmt --check
/opt/homebrew/bin/rtk terramate list
/opt/homebrew/bin/rtk terramate run terraform validate
```

### AWS

```bash
/opt/homebrew/bin/rtk aws sts get-caller-identity
/opt/homebrew/bin/rtk aws configure list
/opt/homebrew/bin/rtk aws eks list-clusters
/opt/homebrew/bin/rtk aws eks update-kubeconfig --name <cluster> --region <region>
/opt/homebrew/bin/rtk aws logs tail <log-group> --since 1h
```

### Google Cloud

```bash
/opt/homebrew/bin/rtk gcloud config list
/opt/homebrew/bin/rtk gcloud auth list
/opt/homebrew/bin/rtk gcloud container clusters list
/opt/homebrew/bin/rtk gcloud container clusters get-credentials <cluster> --region <region> --project <project>
```

### CI and Local Checks

```bash
/opt/homebrew/bin/rtk make help
/opt/homebrew/bin/rtk npm test
/opt/homebrew/bin/rtk npm run lint
/opt/homebrew/bin/rtk npm run build
/opt/homebrew/bin/rtk go test ./...
/opt/homebrew/bin/rtk cargo test
```

## Operational Safety

- Confirm the active cloud account, Kubernetes context, and namespace before changing live systems.
- Prefer read-only inspection commands before mutation commands.
- For production, show the planned change and wait for user confirmation before applying infrastructure, deploy, rollback, or delete operations.
- Capture enough context for failures: command, environment, namespace/project/account, and the smallest useful log excerpt.
