##################################################################################
### Supporting resources
### NOTE: Run this example in SQS Server-side encryption supported regions like
### US East (N. Virginia), US East (Ohio), and US West (Oregon) regions
##################################################################################
data "aws_kms_alias" "aws_default" {
  name = "alias/aws/sqs"
}

resource "aws_sqs_queue" "main" {
  name                      = "complete-sqs-example"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 1500
  receive_wait_time_seconds = 10
  kms_master_key_id         = data.aws_kms_alias.aws_default.target_key_id
}

## Note: This example picks the latest version of the source module
module "complete_sns_topic" {
  source         = "../../"
  name           = "complete-sns-example"
  create_kms_key = true
  delivery_policy = jsonencode(
    {
      http = {
        defaultHealthyRetryPolicy = {
          backoffFunction    = "linear"
          maxDelayTarget     = 20
          minDelayTarget     = 20
          numMaxDelayRetries = 0
          numMinDelayRetries = 0
          numNoDelayRetries  = 0
          numRetries         = 3
        }
        defaultThrottlePolicy = {
          maxReceivesPerSecond = 1
        }
        disableSubscriptionOverrides = false
      }
    }
  )

  ### subscription
  sns_topic_subscriptions = {
    sqs = {
      endpoint             = aws_sqs_queue.main.arn
      protocol             = "sqs"
      raw_message_delivery = true
    }
  }
}
