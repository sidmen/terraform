variable "vsphere_user" {
  type = "string"
  description = "root user"
  default = "user@domain"
}


variable "vsphere_password" {
  type = "string"
  description = "root password"
  default = "**********"
}


variable "vsphere_server" {
  type = "string"
  default = "X.X.X.X"
}

variable "vsphere_vm_folder" {
  type = "string"
  default = "Dillinger_GCO_Automation/spoonath/terraform-ubuntu-01"
}
