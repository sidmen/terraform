provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Outlands"
}

data "vsphere_datastore" "datastore" {
  name          = "Dillinger-DS2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


# data "vsphere_host" "host" {
#   name          = "X.X.X.X"
#   datacenter_id = "${data.vsphere_datacenter.dc.id}"
# }

data "vsphere_resource_pool" "pool" {
  name          = "GCO_Automation"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "vlan 721"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


# # Create a vSphere VM folder
# resource "vsphere_folder" "terraform-ubuntu-01" {
#   datacenter_id = "${data.vsphere_datacenter.dc.id}"
#   path = "${var.vsphere_vm_folder}"
#   type = "vm"
# }

# Create VM
resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test-1"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  folder = "Dillinger_GCO_Automation/spoonath"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  num_cpus = 2
  memory   = 1024
  guest_id = "other3xLinux64Guest"
  wait_for_guest_net = false
  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    name = "terraform-test.vmdk"
    size = 16
  }


}


# resource "vsphere_virtual_machine" "test01" {
#   name   = "test01"
#   vcpu   = 2
#   memory = 4096
#   # domain = "lab.corvisa.it"
#   datacenter = "Outlands"
#   cluster = "Dillinger"
#   folder = "${vsphere_folder.terraform-ubuntu-01.path}"
#   network_interface {
#       label = "vlan 721"
#       # ipv4_gateway = "X.X.X.X"   
#   }

#   disk {
#     datastore = "Dillinger-DS2"
#     type      = "thin"
#     template = "Dillinger_GCO_Automation/spoonath/New Virtual Machine"
#   }
# }
