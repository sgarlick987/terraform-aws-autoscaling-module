resource "aws_autoscaling_schedule" "up_time_schedule" {
  scheduled_action_name = "recurrence_scale_up"
  min_size = "${var.up_min_size}"
  max_size = "${var.up_max_size}"
  desired_capacity = "${var.up_desired_size}"
  recurrence = "${var.up_recurrence}"
  autoscaling_group_name = "${var.autoscaling_group_name}"
}


resource "aws_autoscaling_schedule" "down_time_schedule" {
  scheduled_action_name = "recurrence_scale_down"
  min_size = "${var.down_min_size}"
  max_size = "${var.down_max_size}"
  desired_capacity = "${var.down_desired_size}"
  recurrence = "${var.down_recurrence}"
  autoscaling_group_name = "${var.autoscaling_group_name}"
}