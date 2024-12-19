# Hashicorp Vault Backend

> [Datadog Agent Secrets](https://docs.datadoghq.com/agent/guide/secrets-management/?tab=linux) using [Hashicorp Vault Secrets Engine](https://learn.hashicorp.com/tutorials/vault/static-secrets)

## Configuration

### Backend Settings

| Setting | Description |
| --- | --- |
| backend_type | Backend type |
| secret_path| Vault secret prefix, recursive |
| secrets | List of individual Vault secrets |
| vault_address | DNS/IP of the Hashicorp Vault system |
| vault_tls_config | TLS Configuration to access the Vault system |

### TLS Settings

| Setting | Description |
| --- | --- |
| ca_cert | Path to PEM-encoded CA cert file to verify the Vault server SSL certificate |
| ca_path | Path to directory of PEM-encoded CA cert files to verify the Vault server SSL certificate |
| client_cert | Path to the certificate for Vault communication |
| client_key | Path to the private key for Vault communication |
| tls_server | If set, is used to set the SNI host when connecting via TLS |
| Insecure | Enables or disables SSL verification (bool) |

### Vault Session Settings

| Setting | Auth Method | Description |
| --- | --- | --- |
| vault_role_id | AppRole | AppRole ID |
| vault_secret_id | AppRole | AppRole Secret ID |
| vault_username | UserPass | Username |
| vault_password | UserPass | Password |
| vault_ldap_username | LDAP | LDAP username|
| vault_ldap_password | LDAP | LDAP password |
| vault_kubeauth_role | Kubernetes | Kubernetes service account role name |
| vault_kubeauth_token_env | Kubernetes | Kubernetes service account token environment variable name |
| vault_kubeauth_token_path | Kubernetes | Kubernetes service account token path |

## Backend Configuration

The backend configuration for Hashicorp Vault has the following pattern:

```yaml
---
backends:
  {backendId}:
    backend_type: hashicorp.vault
    vault_address: http://myvaultaddress.net
    vault_tls_config:
        # ... TLS settings if applicable
    vault_session:
      vault_role_id: {roleId}
      # ... additional session settings
    secret_path: /Path/To/Secrets
    secrets:
      - secret1
      - secret2
      - secret3
```

**backend_type** must be set to `hashicorp.vault` and both **secret_path** and **secrets** must be provided in each backend configuration.

The backend secret is referenced in your Datadog Agent configuration files using the **ENC** notation.

```yaml
# /etc/datadog-agent/datadog.yaml

api_key: "ENC[{backendId}:{secret}"

```

The secrets can be fetched using **parameter_path** with **secrets**:

```yaml
# /opt/datadog-secret-backend/datadog-secret-backend.yaml
---
backends:
  MySecretBackend:
    backend_type: hashicorp.vault
    vault_address: vault_address: http://myvaultaddress.net
    vault_tls_config:
        # ... TLS settings if applicable
    secret_path: /Datadog/Production
    secrets:
      - secret1
      - secret2
    vault_session:
      vault_role_id: 123456-************
      vault_secret_id: abcdef-********
```

and finally accessed in the Datadog Agent:

```yaml
# /etc/datadog-agent/datadog.yml
property1: "ENC[MySecretBackend:secret1]"
property2: "ENC[MySecretBackend:secret2]"
```

Multiple secret backends, of the same or different types, can be defined in your `datadog-secret-backend` yaml configuration. As a result, you can leverage multiple supported backends (file.yaml, file.json, aws.ssm, and aws.secrets, azure.keyvault) in your Datadog Agent configuration.

## Configuration Examples

In the following examples, assume the Hashicorp Vault secret path prefix is `/Datadog/Production` with a parameter key of `api_key`:

```sh
/DatadogAgent/Production/api_key: (SecureString) "••••••••••••0f83"
```

Each of the following examples will access the secret from the Datadog Agent configuration yaml file(s) as such:

```yaml
# /etc/datadog-agent/datadog.yaml

#########################
## Basic Configuration ##
#########################

## @param api_key - string - required
## @env DD_API_KEY - string - required
## The Datadog API key to associate your Agent's data with your organization.
## Create a new API key here: https://app.datadoghq.com/account/settings
#
api_key: "ENC[agent_secret:apikey]" 
```

**Hashicorp Vault Authentication with AppRole**

```yaml
# /opt/datadog-secret-backend/datadog-secret-backend.yaml
---
backends:
  MySecretBackend:
    backend_type: hashicorp.vault
    vault_address: vault_address: http://myvaultaddress.net
    vault_tls_config:
        # ... TLS settings if applicable
    secret_path: /Datadog/Production
    secrets:
      - apikey
    vault_session:
      vault_role_id: 123456-************
      vault_secret_id: abcdef-********
```

**Hashicorp Vault Authentication with UserPass**

```yaml
# /opt/datadog-secret-backend/datadog-secret-backend.yaml
---
backends:
  MySecretBackend:
    backend_type: hashicorp.vault
    vault_address: vault_address: http://myvaultaddress.net
    vault_tls_config:
        # ... TLS settings if applicable
    secret_path: /Datadog/Production
    secrets:
      - apikey
    vault_session:
      vault_username: myuser
      vault_password: mypassword
```

**Hashicorp Vault Authentication with LDAP**

```yaml
# /opt/datadog-secret-backend/datadog-secret-backend.yaml
---
backends:
  MySecretBackend:
    backend_type: hashicorp.vault
    vault_address: vault_address: http://myvaultaddress.net
    vault_tls_config:
        # ... TLS settings if applicable
    secret_path: /Datadog/Production
    secrets:
      - apikey
    vault_session:
      vault_ldap_username: myuser
      vault_ldap_password: mypassword
```

**Hashicorp Vault Authentication with Kubernetes - Token in Environment**

```yaml
# /opt/datadog-secret-backend/datadog-secret-backend.yaml
---
backends:
  MySecretBackend:
    backend_type: hashicorp.vault
    vault_address: vault_address: http://myvaultaddress.net
    vault_tls_config:
        # ... TLS settings if applicable
    secret_path: /Datadog/Production
    secrets:
      - apikey
    vault_session:
      vault_kubeauth_role: MyKubernetesRole
      vault_kubeauth_token_env: MY_KUBERNETES_AUTH_TOKEN
```

**Hashicorp Vault Authentication with Kubernetes - Token in Volume Mount**

```yaml
# /opt/datadog-secret-backend/datadog-secret-backend.yaml
---
backends:
  MySecretBackend:
    backend_type: hashicorp.vault
    vault_address: vault_address: http://myvaultaddress.net
    vault_tls_config:
        # ... TLS settings if applicable
    secret_path: /Datadog/Production
    secrets:
      - apikey
    vault_session:
      vault_kubeauth_role: MyKubernetesRole
      # if not specified, uses the default mount: /var/run/secrets/kubernetes.io/serviceaccount
      vault_kubeauth_token_path: /my/custom/service/token/mount/point
```