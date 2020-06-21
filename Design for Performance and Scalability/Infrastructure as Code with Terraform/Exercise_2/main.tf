provider "aws" {
    region = "${var.aws_region}"
}
data "archive_file" "dir_hash_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/${var.zip_filename}"
}
resource "aws_lambda_function" "lambda" {
    role             = "${aws_iam_role.lambda_exec_role.arn}"
    handler          = "${var.lambda_handler}"
    runtime          = "${var.runtime}"
    filename         = "${var.zip_filename}"
    function_name    = "${var.function_name}"
    source_code_hash = "${data.archive_file.dir_hash_zip.output_base64sha256}"
}

resource "aws_iam_role" "lambda_exec_role" {
    name        = "lambda_exec"
    path        = "/"
    description = "Allows Lambda Function to call AWS services on your behalf."
    assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Principal": {
"Service": "lambda.amazonaws.com"
},
"Action": "sts:AssumeRole"
}
]
}
EOF
}