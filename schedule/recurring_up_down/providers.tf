provider "aws" {
  region = "${var.aws_region}"
}

variable "aws_region" {
  description = "the aws region to deploy this environment in"
  type = "string"
  default = "us-east-1"
}
