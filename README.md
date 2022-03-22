# AWS SNS Terraform module

## Description
This terraform module creates sns topic and associated resources.

Example available [here](https://github.com/boldlink/terraform-aws-sns/tree/main/examples)

## Documentation

[Amazon SNS Documentation](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)

[Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic)
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_topic.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_failure_feedback_role_arn"></a> [application\_failure\_feedback\_role\_arn](#input\_application\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_application_success_feedback_role_arn"></a> [application\_success\_feedback\_role\_arn](#input\_application\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_application_success_feedback_sample_rate"></a> [application\_success\_feedback\_sample\_rate](#input\_application\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `string` | `null` | no |
| <a name="input_confirmation_timeout_in_minutes"></a> [confirmation\_timeout\_in\_minutes](#input\_confirmation\_timeout\_in\_minutes) | (Optional) Integer indicating number of minutes to wait in retrying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols. Default is `1`. | `number` | `1` | no |
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | (Optional) Enables content-based deduplication for FIFO topics. | `string` | `null` | no |
| <a name="input_create_sns_topic_policy"></a> [create\_sns\_topic\_policy](#input\_create\_sns\_topic\_policy) | Choose whether to create this resource or not | `bool` | `false` | no |
| <a name="input_create_sns_topic_subscription"></a> [create\_sns\_topic\_subscription](#input\_create\_sns\_topic\_subscription) | Specify whether to create resource | `bool` | `false` | no |
| <a name="input_delivery_policy"></a> [delivery\_policy](#input\_delivery\_policy) | (Optional) The SNS delivery policy. | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | (Optional) The display name for the topic | `string` | `null` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | (Required) Endpoint to send data to. The contents vary with the protocol. | `string` | `""` | no |
| <a name="input_endpoint_auto_confirms"></a> [endpoint\_auto\_confirms](#input\_endpoint\_auto\_confirms) | (Optional) Whether the endpoint is capable of [auto confirming subscription](http://docs.aws.amazon.com/sns/latest/dg/SendMessageToHttp.html#SendMessageToHttp.prepare) (e.g., PagerDuty). Default is `false`. | `bool` | `false` | no |
| <a name="input_fifo_topic"></a> [fifo\_topic](#input\_fifo\_topic) | (Optional) Boolean indicating whether or not to create a FIFO (first-in-first-out) topic (default is `false`). | `bool` | `false` | no |
| <a name="input_filter_policy"></a> [filter\_policy](#input\_filter\_policy) | (Optional) JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource. | `string` | `null` | no |
| <a name="input_firehose_failure_feedback_role_arn"></a> [firehose\_failure\_feedback\_role\_arn](#input\_firehose\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_firehose_success_feedback_role_arn"></a> [firehose\_success\_feedback\_role\_arn](#input\_firehose\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_firehose_success_feedback_sample_rate"></a> [firehose\_success\_feedback\_sample\_rate](#input\_firehose\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `number` | `null` | no |
| <a name="input_http_failure_feedback_role_arn"></a> [http\_failure\_feedback\_role\_arn](#input\_http\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_http_success_feedback_role_arn"></a> [http\_success\_feedback\_role\_arn](#input\_http\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_http_success_feedback_sample_rate"></a> [http\_success\_feedback\_sample\_rate](#input\_http\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `string` | `null` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | (Optional) The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. | `string` | `null` | no |
| <a name="input_lambda_failure_feedback_role_arn"></a> [lambda\_failure\_feedback\_role\_arn](#input\_lambda\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_lambda_success_feedback_role_arn"></a> [lambda\_success\_feedback\_role\_arn](#input\_lambda\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_lambda_success_feedback_sample_rate"></a> [lambda\_success\_feedback\_sample\_rate](#input\_lambda\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. For a FIFO (first-in-first-out) topic, the name must end with the `.fifo` suffix. If omitted, Terraform will assign a random, unique name. Conflicts with `name_prefix` | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional) Creates a unique name beginning with the specified prefix. Conflicts with `name` | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | (Optional) The fully-formed AWS policy as JSON. | `string` | `null` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | (Required) Protocol to use. Valid values are: `sqs`, `sms`, `lambda`, `firehose`, and `application`. Protocols `email`, `email-json`, `http` and `https` are also valid but partially supported. | `string` | `""` | no |
| <a name="input_raw_message_delivery"></a> [raw\_message\_delivery](#input\_raw\_message\_delivery) | (Optional) Whether to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property). Default is `false`. | `bool` | `false` | no |
| <a name="input_redrive_policy"></a> [redrive\_policy](#input\_redrive\_policy) | (Optional) JSON String with the redrive policy that will be used in the subscription. | `string` | `null` | no |
| <a name="input_sns_topic_policy"></a> [sns\_topic\_policy](#input\_sns\_topic\_policy) | (Required) The fully-formed AWS policy as JSON. | `string` | `""` | no |
| <a name="input_sns_topic_subscription"></a> [sns\_topic\_subscription](#input\_sns\_topic\_subscription) | Specify whether to create this resource or not | `bool` | `false` | no |
| <a name="input_sqs_failure_feedback_role_arn"></a> [sqs\_failure\_feedback\_role\_arn](#input\_sqs\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_sqs_success_feedback_role_arn"></a> [sqs\_success\_feedback\_role\_arn](#input\_sqs\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_sqs_success_feedback_sample_rate"></a> [sqs\_success\_feedback\_sample\_rate](#input\_sqs\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `number` | `null` | no |
| <a name="input_subscription_delivery_policy"></a> [subscription\_delivery\_policy](#input\_subscription\_delivery\_policy) | (Optional) JSON String with the delivery policy (retries, backoff, etc.) that will be used in the subscription - this only applies to HTTP/S subscriptions. | `string` | `null` | no |
| <a name="input_subscription_role_arn"></a> [subscription\_role\_arn](#input\_subscription\_role\_arn) | (Required if protocol is `firehose`) ARN of the IAM role to publish to Kinesis Data Firehose delivery stream. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key-value map of resource tags. If configured with a provider [default\_tags configuration block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/docs#default_tags-configuration-block) present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the SNS topic, as a more obvious property (clone of id) |
| <a name="output_id"></a> [id](#output\_id) | The ARN of the SNS topic |
| <a name="output_owner"></a> [owner](#output\_owner) | The AWS Account ID of the SNS topic owner |
| <a name="output_subscription_arn"></a> [subscription\_arn](#output\_subscription\_arn) | ARN of the subscription. |
| <a name="output_subscription_confirmation_was_authenticated"></a> [subscription\_confirmation\_was\_authenticated](#output\_subscription\_confirmation\_was\_authenticated) | Whether the subscription confirmation request was authenticated. |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | ARN of the subscription. |
| <a name="output_subscription_owner_id"></a> [subscription\_owner\_id](#output\_subscription\_owner\_id) | AWS account ID of the subscription's owner. |
| <a name="output_subscription_pending_confirmation"></a> [subscription\_pending\_confirmation](#output\_subscription\_pending\_confirmation) | Whether the subscription has not been confirmed. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider [`default_tags` configuration block](https://registry.terraform.io/docs/providers/aws/index#default_tags-configuration-block). |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
