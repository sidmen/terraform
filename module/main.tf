module "child" {
  source = "./child"
}

module "children" {
  source = "./children"
}


output "child_memory" {
  value = "${module.child.received}"
}


#output "children_memory" {
#  value = "${module.children.received}"
#}

