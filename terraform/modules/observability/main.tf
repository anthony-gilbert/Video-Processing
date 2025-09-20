resource "aws_prometheus_workspace" "video-processor-workspace" {
  alias = "video-processor-workspace"

  tags = {
    Environment = env.environment
  }
}

# Cloudwatch Logging
resource "aws_cloudwatch_log_group" "video-processor-log-group" {
  name = "video-processor-log-group"
}

resource "aws_prometheus_workspace" "prometheus-workspace" {
  logging_configuration {
    log_group_arn = "${aws_cloudwatch_log_group.prometheus-workspace.arn}:*"
  }
}


# AWS KMS Customer Managed Keys (CMK)
resource "aws_prometheus_workspace" "prometheus-workspace-with-cmk" {
  alias       = "prometheus-workspace-with-cmk"
  kms_key_arn = aws_kms_key.prometheus-workspace-with-cmk.arn
}

resource "aws_kms_key" "video-processor-kms-key" {
  description             = "video-processor-kms-key"
  deletion_window_in_days = 7
}