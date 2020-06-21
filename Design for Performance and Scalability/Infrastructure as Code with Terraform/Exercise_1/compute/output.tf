output "server_id_t2" {
  value = "${join(", ", aws_instance.tf_server_t2.*.id)}"
}
output "server_id_m4" {
  value = "${join(", ", aws_instance.tf_server_m4.*.id)}"
}