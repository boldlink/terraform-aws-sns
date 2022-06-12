## For test and example purpose we are using the AWS default kms key for SNS (module default)
## Provide your CMK KMS by specifying `kms_master_key_arn = <YOUR_KMS_ARN_HERE>`
## Alternatively, create a CMK KMS using this module by specifying `create_kms_key = true`

locals {
  name = "fifo-external-cmk.fifo"
}

## Note: This example picks the latest version of the source module
module "fifo_sns_topic" {
  source                      = "../../"
  name                        = local.name
  fifo_topic                  = true
  content_based_deduplication = true

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
}
