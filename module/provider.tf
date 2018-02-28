
provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
#  version = "~> 1.1"
  # if you have a self-signed cert
  allow_unverified_ssl = true
  client_debug = true
}

