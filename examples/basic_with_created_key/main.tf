locals {
  name = "test-sns-topic.fifo"
}

## Note: This example picks the latest version of the source module
module "aws_sns_topic" {
  source                      = "boldlink/sns/aws"
  name                        = local.name
  create_kms_key              = true
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
}
