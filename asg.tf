resource "aws_launch_configuration" "launch_config" {
  name = "${var.application}-${var.environment}-${var.detail}-v000"
  image_id = "${var.image_id}"
  key_name = "${var.environment}"
  instance_type = "${var.instance_type}"
  security_groups = ["${aws_security_group.instance_security_group}"]
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name = "${var.application}-${var.environment}-${var.detail}-v000"
  max_size = 1
  min_size = 1
  health_check_grace_period = 600
  health_check_type = "${var.autoscaling_healthcheck_type}"
  desired_capacity = 1
  launch_configuration = "${aws_launch_configuration.launch_config.name}"
  load_balancers = [
    "${aws_elb.load_balancer.name}"]
  vpc_zone_identifier = [
    "${var.load_balancer_subnet_ids}"]

  tag {
    key = "Name"
    value = "${var.application}-${var.environment}-${var.detail}-v000"
    propagate_at_launch = true
  }
  tag {
    key = "Environment"
    value = "${var.environment}"
    propagate_at_launch = false
  }
  tag {
    key = "Application"
    value = "${var.application}"
    propagate_at_launch = false
  }
  tag {
    key = "Detail"
    value = "${var.detail}"
    propagate_at_launch = false
  }
}
