provider "aws" {
  region = "${var.aws_region}"
}
module "networking" {
  source        = "./networking"
  vpc_id        = "${var.vpc_id}"
  subnet_id     = "${var.subnet_id}"
}

module "compute" {
  source              = "./compute"
  instance_count_t2   = "${var.instance_count_t2}"
  instance_count_m4   = "${var.instance_count_m4}"
  key_name            = "${var.key_name}"
  public_key_path     = "${var.public_key_path}"
  instance_type_t2    = "${var.instance_type_t2}"
  instance_type_m4    = "${var.instance_type_m4}"
  subnet_id           = "${var.subnet_id}"
}