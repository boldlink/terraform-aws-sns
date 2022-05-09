# For test and example purpose we are using the AWS default kms key for SNS
# Replace the name with your kms key alias
data "aws_kms_alias" "aws_default" {
  name = "alias/aws/sns"
}

## Note: This example picks the latest version of the source module
module "fifo_sns_topic" {
  source                      = "boldlink/sns/aws"
  name                        = "fifo-external-cmk.fifo"
  kms_master_key_id           = data.aws_kms_alias.aws_default.target_key_id
  fifo_topic                  = true
  content_based_deduplication = true
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
}
