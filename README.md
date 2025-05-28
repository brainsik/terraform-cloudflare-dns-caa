# terraform-cloudflare-dns-caa

Create Cloudflare [DNS CAA records](https://www.rfc-editor.org/rfc/rfc8659).

The Zone ID can be found on the Cloudflare overview page for the domain you
want to add records to.

## Cloudflare v4

The main branch version of this module (not yet released) supports the
Cloudflare v5 provider which changed the name of the resource used to create
DNS records. To continue using Cloudflare v4 without interruption, pin to v2
of this module:

```hcl
  source  = "brainsik/dns-caa/cloudflare"
  version = "~> 2"
```

## Usage

To create a root `example.com` CAA record saying [Let's Encrypt](https://letsencrypt.org)
can issue hostname certificates and _no_ CA can
issue wildcards:

```hcl
module "example_com_caa" {
  source = "brainsik/dns-caa/cloudflare"

  zone_id   = "313372600deadcodebea5751993defc0"
  name      = "example.com"
  issue     = ["letsencrypt.org"]
  issuewild = [";"]
}
```

The same record, but with ACME CAA Account and Method Bindings:

```hcl
module "example_com_caa" {
  source = "brainsik/dns-caa/cloudflare"

  zone_id   = "313372600deadcodebea5751993defc0"
  name      = "example.com"
  issue     = ["letsencrypt.org; accounturi=https://acme-v02.api.letsencrypt.org/acme/acct/123456789; validationmethods=http-01"]
  issuewild = [";"]
}
```

To create a root `example.com` CAA record saying both [Let's Encrypt](https://letsencrypt.org)
and [ZeroSSL](https://zerossl.com) can issue hostname certificates and _no_ CA can
issue wildcards:

```hcl
module "example_com_caa" {
  source = "brainsik/dns-caa/cloudflare"

  zone_id   = "313372600deadcodebea5751993defc0"
  name      = "example.com"
  issue     = ["letsencrypt.org", "sectigo.com"]
  issuewild = [";"]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_dns_record.caa_iodef](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.caa_issue](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [cloudflare_dns_record.caa_issuewild](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iodef"></a> [iodef](#input\_iodef) | URL to send violation reports to | `set(string)` | `[]` | no |
| <a name="input_issue"></a> [issue](#input\_issue) | Domain name of CA that can issue certificates for specific hostnames | `set(string)` | `[]` | no |
| <a name="input_issuewild"></a> [issuewild](#input\_issuewild) | Domain name of CA that can issue wildcard certificates | `set(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the record | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Cloudflare DNS zone ID to add the record to | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
