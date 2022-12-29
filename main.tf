/**
 * Create Cloudflare [DNS CAA records](https://www.rfc-editor.org/rfc/rfc8659).
 *
 * ## Usage
 *
 * ```hcl
 * module "example_com_caa" {
 *   source = "brainsik/dns-caa/cloudflare"
 *
 *   zone_id   = "313372600deadcodebea5751993defc0"
 *   name      = "example.com"
 *   issue     = "letsencrypt.org"
 *   issuewild = ";"
 * }
 * ```
 *
 * This will create root CAA records for example.com. They say only Let's
 * Encrypt should issue certificates for specific hostnames and no CA should
 * issue wildcard certificates.
 */

resource "cloudflare_record" "caa_issue" {
  count = var.issue != "" ? 1 : 0

  zone_id = var.zone_id
  name    = var.name
  type    = "CAA"
  ttl     = 1

  data {
    flags = 0
    tag   = "issue"
    value = var.issue
  }
}

resource "cloudflare_record" "caa_issuewild" {
  count = var.issuewild != "" ? 1 : 0

  zone_id = var.zone_id
  name    = var.name
  type    = "CAA"
  ttl     = 1

  data {
    flags = 0
    tag   = "issuewild"
    value = var.issuewild
  }
}

resource "cloudflare_record" "caa_iodef" {
  count = var.iodef != "" ? 1 : 0

  zone_id = var.zone_id
  name    = "theory.org"
  type    = "CAA"
  ttl     = 1

  data {
    flags = 0
    tag   = "iodef"
    value = var.iodef
  }
}
