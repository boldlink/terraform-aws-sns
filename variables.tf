/*
sns topic
*/

variable "name" {
  type        = string
  description = "(Optional) The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. For a FIFO (first-in-first-out) topic, the name must end with the `.fifo` suffix. If omitted, Terraform will assign a random, unique name. Conflicts with `name_prefix`"
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with `name`"
  default     = null
}

variable "display_name" {
  type        = string
  description = "(Optional) The display name for the topic"
  default     = null
}

variable "policy" {
  type        = string
  description = "(Optional) The fully-formed AWS policy as JSON."
  default     = null
}

variable "delivery_policy" {
  type        = string
  description = "(Optional) The SNS delivery policy."
  default     = null
}

variable "application_success_feedback_role_arn" {
  type        = string
  description = "(Optional) The IAM role permitted to receive success feedback for this topic"
  default     = null
}

variable "application_success_feedback_sample_rate" {
  type        = string
  description = "(Optional) Percentage of success to sample"
  default     = null
}

variable "application_failure_feedback_role_arn" {
  type        = string
  description = "(Optional) IAM role for failure feedback"
  default     = null
}

variable "http_success_feedback_role_arn" {
  type        = string
  description = "(Optional) The IAM role permitted to receive success feedback for this topic"
  default     = null
}

variable "http_success_feedback_sample_rate" {
  type        = string
  description = "(Optional) Percentage of success to sample"
  default     = null
}

variable "http_failure_feedback_role_arn" {
  type        = string
  description = "(Optional) IAM role for failure feedback"
  default     = null
}

variable "kms_master_key_id" {
  type        = string
  description = "(Optional) The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK."
  default     = null
}

variable "fifo_topic" {
  type        = bool
  description = "(Optional) Boolean indicating whether or not to create a FIFO (first-in-first-out) topic (default is `false`)."
  default     = false
}

variable "content_based_deduplication" {
  type        = string
  description = "(Optional) Enables content-based deduplication for FIFO topics."
  default     = null
}

variable "lambda_success_feedback_role_arn" {
  type        = string
  description = "(Optional) The IAM role permitted to receive success feedback for this topic"
  default     = null
}

variable "lambda_success_feedback_sample_rate" {
  type        = number
  description = "(Optional) Percentage of success to sample"
  default     = null
}

variable "lambda_failure_feedback_role_arn" {
  type        = string
  description = "(Optional) IAM role for failure feedback"
  default     = null
}

variable "sqs_success_feedback_role_arn" {
  type        = string
  description = "(Optional) The IAM role permitted to receive success feedback for this topic"
  default     = null
}

variable "sqs_success_feedback_sample_rate" {
  type        = number
  description = "(Optional) Percentage of success to sample"
  default     = null
}

variable "sqs_failure_feedback_role_arn" {
  type        = string
  description = "(Optional) IAM role for failure feedback"
  default     = null
}

variable "firehose_success_feedback_role_arn" {
  type        = string
  description = "(Optional) The IAM role permitted to receive success feedback for this topic"
  default     = null
}

variable "firehose_success_feedback_sample_rate" {
  type        = number
  description = "(Optional) Percentage of success to sample"
  default     = null
}

variable "firehose_failure_feedback_role_arn" {
  type        = string
  description = "(Optional) IAM role for failure feedback"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider [default_tags configuration block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/docs#default_tags-configuration-block) present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

/*
sns topic policy
*/

variable "sns_topic_policy" {
  type        = string
  description = "(Required) The fully-formed AWS policy as JSON."
  default     = ""
}

variable "create_sns_topic_policy" {
  type        = bool
  description = "Choose whether to create this resource or not"
  default     = false
}

/*
sns topic subscription
*/

variable "endpoint" {
  type        = string
  description = "(Required) Endpoint to send data to. The contents vary with the protocol."
  default     = ""
}

variable "protocol" {
  type        = string
  description = "(Required) Protocol to use. Valid values are: `sqs`, `sms`, `lambda`, `firehose`, and `application`. Protocols `email`, `email-json`, `http` and `https` are also valid but partially supported."
  default     = ""
}

variable "subscription_role_arn" {
  type        = string
  description = "(Required if protocol is `firehose`) ARN of the IAM role to publish to Kinesis Data Firehose delivery stream."
  default     = ""
}

variable "sns_topic_subscription" {
  type        = bool
  description = "Specify whether to create this resource or not"
  default     = false
}

variable "confirmation_timeout_in_minutes" {
  type        = number
  description = "(Optional) Integer indicating number of minutes to wait in retrying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols. Default is `1`."
  default     = 1
}

variable "subscription_delivery_policy" {
  type        = string
  description = "(Optional) JSON String with the delivery policy (retries, backoff, etc.) that will be used in the subscription - this only applies to HTTP/S subscriptions."
  default     = null
}

variable "endpoint_auto_confirms" {
  type        = bool
  description = "(Optional) Whether the endpoint is capable of [auto confirming subscription](http://docs.aws.amazon.com/sns/latest/dg/SendMessageToHttp.html#SendMessageToHttp.prepare) (e.g., PagerDuty). Default is `false`."
  default     = false
}

variable "filter_policy" {
  type        = string
  description = "(Optional) JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource."
  default     = null
}

variable "raw_message_delivery" {
  type        = bool
  description = "(Optional) Whether to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property). Default is `false`."
  default     = false
}

variable "redrive_policy" {
  type        = string
  description = "(Optional) JSON String with the redrive policy that will be used in the subscription."
  default     = null
}

variable "create_sns_topic_subscription" {
  type        = bool
  description = "Specify whether to create resource"
  default     = false
}
