module "aws_sns_topic_fifo" {
  # source                      = "boldlink/sns/aws"
  name                        = "basic-sns-topic-kms.fifo"
  create_kms_key              = true
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
