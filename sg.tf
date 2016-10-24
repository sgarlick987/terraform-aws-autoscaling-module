resource "aws_security_group" "load_balancer_security_group" {
  name = "${var.application}-${var.environment}-${var.detail}-load-balancer"
  vpc_id = "${var.vpc_id}"

}

resource "aws_security_group_rule" "load_balancer_security_group_ingress" {
  count = "${length(var.load_balancer_ingress_cidr_rules)}"
  from_port = "${lookup(var.load_balancer_ingress_cidr_rules[count.index], "from_port")}"
  to_port = "${lookup(var.load_balancer_ingress_cidr_rules[count.index],"to_port")}"
  protocol = "${lookup(var.load_balancer_ingress_cidr_rules[count.index],"protocol")}"
  type = "ingress"
  security_group_id = "${aws_security_group.load_balancer_security_group.id}"
  cidr_blocks = [
    "${lookup(var.load_balancer_ingress_cidr_rules[count.index], "cidr")}"]
}

resource "aws_security_group" "instance_security_group" {
  name = "${var.application}-${var.environment}-${var.detail}-instance"
  vpc_id = "${var.vpc_id}"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_groups = [
      "${aws_security_group.load_balancer_security_group.id}"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

