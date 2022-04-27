locals {
  name           = "test-sns-topic.fifo"
  sqs_queue_name = "user-updates-queue.fifo"
}

###########################################
### Supporting resources
###########################################
resource "aws_sqs_queue" "main" {
  name                      = local.sqs_queue_name
  delay_seconds             = 90
  fifo_queue                = true
  max_message_size          = 2048
  message_retention_seconds = 1500
  receive_wait_time_seconds = 10
}

## Note: This example picks the latest version of the source module
module "aws_sns_topic" {
  source                      = "boldlink/sns/aws"
  name                        = local.name
  use_default_kms_key         = true
  fifo_topic                  = true
  content_based_deduplication = true
  delivery_policy             = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF

  ### subscription
  sns_topic_subscriptions = {
    sqs = {
      endpoint             = aws_sqs_queue.main.arn
      protocol             = "sqs"
      raw_message_delivery = true
    }
  }
}
