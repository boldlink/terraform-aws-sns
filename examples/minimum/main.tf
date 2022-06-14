## Note: This example picks the latest version of the source module

locals {
  name = "minimum-sns-topic"
}

module "minimum_sns_topic" {
  source = "../../"
  name   = local.name

  tags = {
    Name        = local.name
    Environment = "Dev"
  }
}
