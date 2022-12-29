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
