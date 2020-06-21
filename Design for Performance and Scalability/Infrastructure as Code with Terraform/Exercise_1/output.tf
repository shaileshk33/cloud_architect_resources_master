output "subnet_ips" {
  value = "${join(", ", module.networking.subnet_ips)}"
}
output "public_instances_t2_IDs" {
  value = "${module.compute.server_id_t2}"
}
output "public_instances_m4_IDs" {
  value = "${module.compute.server_id_m4}"
}