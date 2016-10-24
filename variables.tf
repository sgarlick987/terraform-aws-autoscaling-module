variable "environment" {
  description = "the name of the environment to create resources in"
  type = "string"
}

variable "application" {
  description = "the name of the environment to create resources in"
  type = "string"
}

variable "detail" {
  description = "a unique string to identify a set of servesr that make up an individual component of an application"
}

variable "aws_region" {
  description = "the aws region to deploy this environment in"
  type = "string"
  default = "us-east-1"
}

variable "load_balancer_subnet_ids" {
  description = "list of subnets to deploy load balancers into"
  type = "list"
}

variable "instance_subnet_ids" {
  description = "list of subnets to deploy instnaces into"
  type = "list"
}

variable "image_id" {
  description = "the aws machine image id for this autoscaling group"
  type = "string"
}

variable "instance_type" {
  description = "the instance type to use for the autoscaling group"
  type = "string"
  default = "t2.micro"
}

variable "route53_domain" {
  description = "the domain name for route53 record creatoin"
  type = "string"
}

variable "route53_zone" {
  description = "the zone for route53 record creation"
  type = "string"
}