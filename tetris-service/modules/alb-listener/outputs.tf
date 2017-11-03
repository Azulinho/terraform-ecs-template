output "target_group_arn" {
  value = "${aws_alb_target_group.tetris_service_tg.arn}"
}
