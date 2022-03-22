/*
sns topic
*/

resource "aws_sns_topic" "main" {
  name                                     = var.name
  name_prefix                              = var.name != null ? null : var.name_prefix
  display_name                             = var.display_name
  policy                                   = var.policy
  delivery_policy                          = var.delivery_policy
  application_success_feedback_role_arn    = var.application_success_feedback_role_arn
  application_success_feedback_sample_rate = var.application_success_feedback_sample_rate
  application_failure_feedback_role_arn    = var.application_failure_feedback_role_arn
  http_success_feedback_role_arn           = var.http_success_feedback_role_arn
  http_success_feedback_sample_rate        = var.http_success_feedback_sample_rate
  http_failure_feedback_role_arn           = var.http_failure_feedback_role_arn
  kms_master_key_id                        = var.kms_master_key_id
  fifo_topic                               = var.fifo_topic
  content_based_deduplication              = var.content_based_deduplication
  lambda_success_feedback_role_arn         = var.lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate      = var.lambda_success_feedback_sample_rate
  lambda_failure_feedback_role_arn         = var.lambda_failure_feedback_role_arn
  sqs_success_feedback_role_arn            = var.sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate         = var.sqs_success_feedback_sample_rate
  sqs_failure_feedback_role_arn            = var.sqs_failure_feedback_role_arn
  firehose_success_feedback_role_arn       = var.firehose_success_feedback_role_arn
  firehose_success_feedback_sample_rate    = var.firehose_success_feedback_sample_rate
  firehose_failure_feedback_role_arn       = var.firehose_failure_feedback_role_arn
  tags                                     = var.tags
}

/*
sns topic policy
*/

resource "aws_sns_topic_policy" "main" {
  count  = var.create_sns_topic_policy ? 1 : 0
  arn    = aws_sns_topic.main.arn
  policy = var.sns_topic_policy
}

/*
sns topic subscription
*/

resource "aws_sns_topic_subscription" "main" {
  count                           = var.create_sns_topic_subscription ? 1 : 0
  topic_arn                       = aws_sns_topic.main.arn
  endpoint                        = var.endpoint
  protocol                        = var.protocol
  subscription_role_arn           = var.subscription_role_arn
  confirmation_timeout_in_minutes = var.confirmation_timeout_in_minutes
  delivery_policy                 = var.subscription_delivery_policy
  endpoint_auto_confirms          = var.endpoint_auto_confirms
  filter_policy                   = var.filter_policy
  raw_message_delivery            = var.raw_message_delivery
  redrive_policy                  = var.redrive_policy
}
