###########################################
### Supporting resources
###########################################
resource "aws_sqs_queue" "main" {
  name                      = "complete-sqs-example"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 1500
  receive_wait_time_seconds = 10
}

## Note: This example picks the latest version of the source module
module "aws_sns_topic_complete" {
  source                      = "boldlink/sns/aws"
  name                        = "complete-sns-example"
  create_kms_key              = true
  delivery_policy             = jsonencode({
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
