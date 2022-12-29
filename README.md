# terraform-cloudflare-dns-caa

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Create Cloudflare [DNS CAA records](https://www.rfc-editor.org/rfc/rfc8659).

## Usage

```hcl
module "example_com_caa" {
  source = "brainsik/dns-caa/cloudflare"

  zone_id   = "313372600deadcodebea5751993defc0"
  name      = "example.com"
  issue     = "letsencrypt.org"
  issuewild = ";"
}
```

This will create root CAA records for example.com. They say only Let's
Encrypt should issue certificates for specific hostnames and no CA should
issue wildcard certificates.

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
