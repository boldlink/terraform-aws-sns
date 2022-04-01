#########################
## sns topic
#########################

output "id" {
  value       = aws_sns_topic.main.id
  description = "The ARN of the SNS topic"
}

output "arn" {
  value       = aws_sns_topic.main.arn
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
}

output "owner" {
  value       = aws_sns_topic.main.owner
  description = "The AWS Account ID of the SNS topic owner"
}

output "tags_all" {
  value       = aws_sns_topic.main.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider [`default_tags` configuration block](https://registry.terraform.io/docs/providers/aws/index#default_tags-configuration-block)."
}

#########################
## sns topic subscription
#########################

output "subscription_arn" {
  value       = aws_sns_topic_subscription.main.*.arn
  description = "ARN of the subscription."
}

output "subscription_confirmation_was_authenticated" {
  value       = aws_sns_topic_subscription.main.*.confirmation_was_authenticated
  description = "Whether the subscription confirmation request was authenticated."
}

output "subscription_id" {
  value       = aws_sns_topic_subscription.main.*.id
  description = "ARN of the subscription."
}

output "subscription_owner_id" {
  value       = aws_sns_topic_subscription.main.*.owner_id
  description = "AWS account ID of the subscription's owner."
}

output "subscription_pending_confirmation" {
  value       = aws_sns_topic_subscription.main.*.pending_confirmation
  description = "Whether the subscription has not been confirmed."
}
