output "subnet_ips" {
  value = "${data.aws_subnet.selected.*.cidr_block}"
}