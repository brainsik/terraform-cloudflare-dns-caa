variable "zone_id" {
  description = "The Cloudflare DNS zone ID to add the record to"

  type = string
}

variable "name" {
  description = "The name of the record"

  type = string
}

variable "issue" {
  description = "Domain name of CA that can issue certificates for specific hostnames"

  type    = set(string)
  default = []
}

variable "issuewild" {
  description = "Domain name of CA that can issue wildcard certificates"

  type    = set(string)
  default = []
}

variable "iodef" {
  description = "URL to send violation reports to"

  type    = set(string)
  default = []
}
