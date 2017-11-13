terraform {
  required_version = ">= 0.10.0"
}

resource "godaddy_domain_record" "a_record" {
  count = "${var.count}"
  domain   = "${element(var.domains, count.index)}"

  record {
    name = "@"
    type = "A"
    data = "${element(var.data, count.index)}"
    ttl = 600
  }

  record {
    name = "www"
    type = "CNAME"
    data = "@"
    ttl = 600
  }

  nameservers = "${var.nameservers}"
}