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

variable "cluster_min_size" {
  description = "the minimum size of the cluster"
  type = "string"
}

variable "cluster_max_size" {
  description = "the maximum size of the cluster"
  type = "string"
}
variable "cluster_desired_size" {
  description = "the desired size of the cluster"
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

variable "vpc_id" {
  description = "the vpc to create resources in"
  type = "string"
}
variable "asg_version" {
  description = "the version of the launch config and asg to create"
  type = "string"
  default = "v000"
}

variable "autoscaling_healthcheck_type" {
  description = "the health check type for the instances in the autoscaling group"
  type = "string"
  default = "EC2"
}

variable "load_balancer_ingress_cidr_rules" {
  type = "list"
  default = [
    {
      "from_port" = "443",
      "to_port" = "443",
      "protocol" = "tcp",
      "cidr" = "0.0.0.0/0"
    },
    {
      "from_port" = "80",
      "to_port" = "80",
      "protocol" = "tcp",
      "cidr" = "0.0.0.0/0"
    }]
}

variable "instance_ingress_cidr_rules" {
  type = "list"
  default = [
    {
      "from_port" = "-1",
      "to_port" = "-1",
      "protocol" = "icmp",
      "cidr" = "0.0.0.0/0"
    }]
}

variable "instance_egress_cidr_rules" {
  type = "list"
  default = [
    {
      "from_port" = "443",
      "to_port" = "443",
      "protocol" = "tcp",
      "cidr" = "0.0.0.0/0"
    },
    {
      "from_port" = "80",
      "to_port" = "80",
      "protocol" = "tcp",
      "cidr" = "0.0.0.0/0"
    },
    {
      "from_port" = "-1",
      "to_port" = "-1",
      "protocol" = "icmp",
      "cidr" = "0.0.0.0/0"
    }]
}

variable "instance_load_balancer_ingress_ports" {
  type = "list"
  default = [
    {
      "from_port" = "8080",
      "to_port" = "8080",
      "protocol" = "tcp"
    }]
}

variable "elb_health_check" {
  type = "string"
  default = "HTTP:8080/"
}