module github.com/DataDog/datadog-secret-backend

go 1.23.3

toolchain go1.23.4

replace (
	github.com/DataDog/datadog-secret-backend/backend => ./backend
	github.com/DataDog/datadog-secret-backend/backend/aws => ./backend/aws
	github.com/DataDog/datadog-secret-backend/backend/aws/secretsmanager => ./backend/aws/secretsmanager
)

require (
	github.com/aws/aws-sdk-go-v2 v1.33.0
	github.com/aws/aws-sdk-go-v2/config v1.29.0
	github.com/aws/aws-sdk-go-v2/credentials v1.17.53
	github.com/aws/aws-sdk-go-v2/service/secretsmanager v1.34.12
	github.com/aws/aws-sdk-go-v2/service/ssm v1.56.6
	github.com/aws/aws-sdk-go-v2/service/sts v1.33.8
	github.com/hashicorp/vault/api v1.15.0
	github.com/hashicorp/vault/api/auth/approle v0.8.0
	github.com/hashicorp/vault/api/auth/kubernetes v0.8.0
	github.com/hashicorp/vault/api/auth/ldap v0.8.0
	github.com/hashicorp/vault/api/auth/userpass v0.8.0
	github.com/mitchellh/mapstructure v1.5.0
	github.com/rs/zerolog v1.33.0
	github.com/sirupsen/logrus v1.9.3
	gopkg.in/yaml.v2 v2.4.0
)

require (
	github.com/Azure/azure-sdk-for-go v68.0.0+incompatible
	github.com/Azure/go-autorest/autorest v0.11.29
	github.com/Azure/go-autorest/autorest/azure/auth v0.5.13
	github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.16.24 // indirect
	github.com/aws/aws-sdk-go-v2/internal/ini v1.8.1 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.12.9 // indirect
	github.com/aws/aws-sdk-go-v2/service/sso v1.24.10 // indirect
	github.com/aws/smithy-go v1.22.1 // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	golang.org/x/sys v0.29.0 // indirect
)

require (
	github.com/Azure/go-autorest v14.2.0+incompatible // indirect
	github.com/Azure/go-autorest/autorest/adal v0.9.24 // indirect
	github.com/Azure/go-autorest/autorest/azure/cli v0.4.6 // indirect
	github.com/Azure/go-autorest/autorest/date v0.3.0 // indirect
	github.com/Azure/go-autorest/autorest/to v0.4.0 // indirect
	github.com/Azure/go-autorest/autorest/validation v0.3.1 // indirect
	github.com/Azure/go-autorest/logger v0.2.1 // indirect
	github.com/Azure/go-autorest/tracing v0.6.0 // indirect
	github.com/aws/aws-sdk-go-v2/internal/configsources v1.3.28 // indirect
	github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.6.28 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.12.1 // indirect
	github.com/aws/aws-sdk-go-v2/service/ssooidc v1.28.9 // indirect
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/dimchansky/utfbom v1.1.1 // indirect
	github.com/go-jose/go-jose/v4 v4.0.4 // indirect
	github.com/go-test/deep v1.1.0 // indirect
	github.com/golang-jwt/jwt/v4 v4.5.1 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.2 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/hashicorp/go-retryablehttp v0.7.7 // indirect
	github.com/hashicorp/go-rootcerts v1.0.2 // indirect
	github.com/hashicorp/go-secure-stdlib/parseutil v0.1.9 // indirect
	github.com/hashicorp/go-secure-stdlib/strutil v0.1.2 // indirect
	github.com/hashicorp/go-sockaddr v1.0.7 // indirect
	github.com/hashicorp/hcl v1.0.1-vault-7 // indirect
	github.com/mattn/go-colorable v0.1.14 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/ryanuber/go-glob v1.0.0 // indirect
	golang.org/x/crypto v0.32.0 // indirect
	golang.org/x/net v0.34.0 // indirect
	golang.org/x/text v0.21.0 // indirect
	golang.org/x/time v0.9.0 // indirect
	gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f // indirect
)
