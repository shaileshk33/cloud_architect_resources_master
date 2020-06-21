data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "tf_auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "tf_server_t2" {
  count         = "${var.instance_count_t2}"
  instance_type = "${var.instance_type_t2}"
  ami           = "${data.aws_ami.server_ami.id}"

  tags = {
    Name = "Udacity T2 - ${count.index +1}"
  }
  key_name      = "${aws_key_pair.tf_auth.id}"
  subnet_id     = "${var.subnet_id}"
}

resource "aws_instance" "tf_server_m4" {
  count         = "${var.instance_count_m4}"
  instance_type = "${var.instance_type_m4}"
  ami           = "${data.aws_ami.server_ami.id}"

  tags = {
    Name = "Udacity M4 - ${count.index +1}"
  }
  key_name      = "${aws_key_pair.tf_auth.id}"
  subnet_id     = "${var.subnet_id}"
}

