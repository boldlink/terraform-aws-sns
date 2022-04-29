locals {
  name = "basic-sns-topic.fifo"
}

## Note: This example picks the latest version of the source module
module "aws_sns_topic" {
  source                      = "boldlink/sns/aws"
  name                        = "basic-sns-topic.fifo"
}
