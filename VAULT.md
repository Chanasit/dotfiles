# Vault Setup

Local [HashiCorp Vault](https://developer.hashicorp.com/vault) dev server for storing secrets. KV secrets engine + admin policy.

## Prerequisites

- `vault` CLI installed (`brew install vault`)
- `VAULT_ADDR` exported (already set in `.zshrc`):

  ```sh
  export VAULT_ADDR="http://127.0.0.1:8200"
  ```

## 1. Start server

Dev mode (in-memory, unsealed, single unseal key — **local only**):

```sh
vault server -dev
```

Copy the printed `Root Token` and `Unseal Key`. Then in a second shell:

```sh
export VAULT_ADDR="http://127.0.0.1:8200"
export VAULT_TOKEN="<root-token>"
vault status
```

## 2. Enable KV secrets engine

The `admin-policy.hcl` grants access to the `kv/` path. Enable it:

```sh
vault secrets enable -path=kv kv-v2
```

## 3. Load admin policy

`admin-policy.hcl` grants full access to `kv/*` and `sys/*`:

```hcl
path "kv/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "sys/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
```

Write it:

```sh
vault policy write admin admin-policy.hcl
```

Create a token bound to it:

```sh
vault token create -policy=admin
```

## 4. Store / read secrets

```sh
vault kv put kv/myapp db_password=s3cret api_key=abc123
vault kv get kv/myapp
vault kv get -field=db_password kv/myapp
```

## Security notes

- `-dev` mode is **non-persistent and insecure**. Data lost on restart. Never use in prod.
- `admin-policy.hcl` is broad (full `sys/*` = root-equivalent). Scope tighter for shared or prod environments.
- **Never** hardcode `VAULT_TOKEN` or secrets in tracked files. Fetch from env or the CLI login.
- Root token is for bootstrap only. Issue scoped tokens for real use.

## Teardown

```sh
# stop dev server: Ctrl-C in the server shell (in-memory data wiped)
unset VAULT_TOKEN
```
