# terraform-cloudflare-dns-caa

Create Cloudflare [DNS CAA records](https://www.rfc-editor.org/rfc/rfc8659).

The Zone ID can be found on the Cloudflare overview page for the domain you
want to add records to.

CAA authorizations are additive. Create a separate record for each CA you want
to authorize. Note this means specifying both an empty issuer domain (`;`) and
a non-empty domain is the same as specifying just the non-empty domain.

## Usage

To create a root `example.com` CAA record saying [Let's Encrypt](https://letsencrypt.org)
can issue hostname certificates and _no_ CA can
issue wildcards:

```hcl
module "example_com_caa" {
  source = "brainsik/dns-caa/cloudflare"

  zone_id   = "313372600deadcodebea5751993defc0"
  name      = "example.com"
  issue     = "letsencrypt.org"
  issuewild = ";"
}
```

The same record, but with ACME CAA Account and Method Bindings:

```hcl
module "example_com_caa" {
  source = "brainsik/dns-caa/cloudflare"

  zone_id   = "313372600deadcodebea5751993defc0"
  name      = "example.com"
  issue     = "letsencrypt.org; accounturi=https://acme-v02.api.letsencrypt.org/acme/acct/123456789; validationmethods=http-01"
  issuewild = ";"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.caa_iodef](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.caa_issue](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.caa_issuewild](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iodef"></a> [iodef](#input\_iodef) | URL to send violation reports to | `string` | `""` | no |
| <a name="input_issue"></a> [issue](#input\_issue) | Domain name of CA that can issue certificates for specific hostnames | `string` | `""` | no |
| <a name="input_issuewild"></a> [issuewild](#input\_issuewild) | Domain name of CA that can issue wildcard certificates | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the record | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Cloudflare DNS zone ID to add the record to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
