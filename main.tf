resource "cloudflare_dns_record" "caa_issue" {
  for_each = var.issue

  name    = var.name
  ttl     = 1
  type    = "CAA"
  zone_id = var.zone_id

  data = {
    flags = "0"
    tag   = "issue"
    value = each.key
  }
}

resource "cloudflare_dns_record" "caa_issuewild" {
  for_each = var.issuewild

  zone_id = var.zone_id
  name    = var.name
  type    = "CAA"
  ttl     = 1

  data = {
    flags = "0"
    tag   = "issuewild"
    value = each.key
  }
}

resource "cloudflare_dns_record" "caa_iodef" {
  for_each = var.iodef

  zone_id = var.zone_id
  name    = "theory.org"
  type    = "CAA"
  ttl     = 1

  data = {
    flags = "0"
    tag   = "iodef"
    value = each.key
  }
}
