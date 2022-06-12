## For test and example purpose we are using the AWS default kms key for SNS (module default)
## Provide your CMK KMS by specifying `kms_master_key_arn = <YOUR_KMS_ARN_HERE>`
## Alternatively, create a CMK KMS using this module by specifying `create_kms_key = true` as used in this example

data "aws_kms_alias" "aws_default" {
  name = "alias/aws/sqs"
}

locals {
  name = "complete-sns-example"
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
  source = "../../"
  name   = local.name
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

  tags = {
    Name        = local.name
    Environment = "Dev"
  }

  ### subscription
  sns_topic_subscriptions = {
    sqs = {
      endpoint             = aws_sqs_queue.main.arn
      protocol             = "sqs"
      raw_message_delivery = true
    }
  }
}
