resource "aws_launch_configuration" "launch_config" {
  name = "${var.application}-${var.environment}-${var.detail}-${var.asg_version}"
  image_id = "${var.image_id}"
  key_name = "${var.environment}"
  instance_type = "${var.instance_type}"
  security_groups = [
    "${aws_security_group.instance_security_group.id}"]
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name = "${aws_launch_configuration.launch_config.name}"
  max_size = "${var.cluster_max_size}"
  min_size = "${var.cluster_min_size}"
  health_check_grace_period = 600
  health_check_type = "${var.autoscaling_healthcheck_type}"
  desired_capacity = "${var.cluster_desired_size}"
  launch_configuration = "${aws_launch_configuration.launch_config.name}"
  load_balancers = [
    "${aws_elb.load_balancer.name}"]
  vpc_zone_identifier = [
    "${var.instance_subnet_ids}"]

  tag {
    key = "Name"
    value = "${aws_launch_configuration.launch_config.name}"
    propagate_at_launch = true
  }
  tag {
    key = "Environment"
    value = "${var.environment}"
    propagate_at_launch = true
  }
  tag {
    key = "Application"
    value = "${var.application}"
    propagate_at_launch = true
  }
  tag {
    key = "Detail"
    value = "${var.detail}"
    propagate_at_launch = true
  }
}

output "autoscaling_group_name" {
  value = "${aws_autoscaling_group.autoscaling_group.name}"
}