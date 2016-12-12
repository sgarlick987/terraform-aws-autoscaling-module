resource "aws_elb" "load_balancer" {
  name = "${var.application}-${var.environment}-${var.detail}"
  subnets = ["${var.load_balancer_subnet_ids}"]

  listener {
    instance_port = 8080
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "${var.elb_health_check}"
    interval = 30
  }
  security_groups = ["${aws_security_group.load_balancer_security_group.id}"]
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  tags {
    Name = "${var.application}-${var.environment}-${var.detail}"
    Environment = "${var.environment}"
    Application = "${var.application}"
    Detail = "${var.detail}"
  }
}
