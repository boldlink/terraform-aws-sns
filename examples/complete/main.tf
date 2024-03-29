## For test and example purpose we are using the AWS default kms key for SNS (module default)
## Provide your CMK KMS by specifying `kms_master_key_arn = <YOUR_KMS_ARN_HERE>`
## Alternatively, create a CMK KMS using this module by specifying `create_kms_key = true` as used in this example
resource "aws_sqs_queue" "main" {
  name                      = "complete-sqs-example"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 1500
  receive_wait_time_seconds = 10
  kms_master_key_id         = local.kms_master_key_id
}

resource "aws_sqs_queue" "example_dead_letter_queue" {
  name              = "example-dead-letter-sqs-queue"
  kms_master_key_id = local.kms_master_key_id
}

module "http_feedback_role" {
  source             = "boldlink/iam-role/aws"
  version            = "1.1.1"
  name               = "${var.name}-http-feedback-role"
  assume_role_policy = data.aws_iam_policy_document.sns_assume_role_policy.json
  description        = "sns role for http success feedback"
  inline_policy = [{
    name   = "example-http-success-policy"
    policy = local.role_policy
  }]
}

module "application_feedback_role" {
  source             = "boldlink/iam-role/aws"
  version            = "1.1.1"
  name               = "${var.name}-application-feedback-role"
  assume_role_policy = data.aws_iam_policy_document.sns_assume_role_policy.json
  description        = "sns role for application success feedback"
  inline_policy = [{
    name   = "example-application-success-policy"
    policy = local.role_policy
  }]
}

## Note: This example picks the latest version of the source module
module "complete_sns_topic" {
  source                                   = "../../"
  name                                     = var.name
  display_name                             = var.name
  create_kms_key                           = true
  create_sns_topic_policy                  = true
  policy                                   = data.aws_iam_policy_document.sns_topic_policy.json
  application_success_feedback_role_arn    = module.application_feedback_role.arn
  application_success_feedback_sample_rate = "50"
  http_success_feedback_role_arn           = module.http_feedback_role.arn
  http_success_feedback_sample_rate        = "100"
  application_failure_feedback_role_arn    = module.application_feedback_role.arn
  http_failure_feedback_role_arn           = module.http_feedback_role.arn
  lambda_success_feedback_role_arn         = module.application_feedback_role.arn
  lambda_success_feedback_sample_rate      = "0"
  lambda_failure_feedback_role_arn         = module.application_feedback_role.arn
  sqs_success_feedback_role_arn            = module.application_feedback_role.arn
  sqs_failure_feedback_role_arn            = module.application_feedback_role.arn
  firehose_success_feedback_role_arn       = module.http_feedback_role.arn
  firehose_success_feedback_sample_rate    = "0"
  firehose_failure_feedback_role_arn       = module.http_feedback_role.arn
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
    Name        = var.name
    Environment = "Dev"
  }

  ### subscription
  sns_topic_subscriptions = {
    sqs = {
      endpoint                        = aws_sqs_queue.main.arn
      protocol                        = "sqs"
      confirmation_timeout_in_minutes = 1
      raw_message_delivery            = true
      endpoint_auto_confirms          = false
      filter_policy                   = <<EOF
      {
        "eventType": ["order_created", "order_updated"],
        "customer_id": [123, 456]
      }
      EOF
      redrive_policy = jsonencode({
        deadLetterTargetArn = aws_sqs_queue.example_dead_letter_queue.arn,
      })
    }
    email = {
      endpoint = "example-email@email.local"
      protocol = "email"
    }
    https = {
      endpoint = "https://example.com/"
      protocol = "https"
      delivery_policy = jsonencode({
        "healthyRetryPolicy" : {
          "minDelayTarget" : 1,
          "maxDelayTarget" : 60,
          "numRetries" : 50,
          "numNoDelayRetries" : 3,
          "numMinDelayRetries" : 2,
          "numMaxDelayRetries" : 35,
          "backoffFunction" : "exponential"
        },
        "throttlePolicy" : {
          "maxReceivesPerSecond" : 10
        },
        "requestPolicy" : {
          "headerContentType" : "application/json"
        }
      })
    }
  }
}
