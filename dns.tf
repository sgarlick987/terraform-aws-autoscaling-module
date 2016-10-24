resource "aws_route53_record" "load_balancer_cname" {
  zone_id = "${var.route53_zone}"
  name = "${var.application}-${var.detail}.${var.environment}.${var.route53_domain}"
  type = "CNAME"
  ttl = "300"
  records = [
    "${aws_elb.load_balancer.dns_name}"]
}