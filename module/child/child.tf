

data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}


 # Create a vSphere VM folder
 resource "vsphere_folder" "module_test_folder" {
   datacenter_id = "${data.vsphere_datacenter.dc.id}"
   path = "${var.vsphere_vm_folder}"
   type = "vm"
 }


#output "folder" {
#  value = "${resource.vsphere_folder.module_test_folder}"
#}

output "received" {
  value = "${var.memory}"
}
