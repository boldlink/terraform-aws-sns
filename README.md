[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-sns/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-sns.svg)](https://github.com/boldlink/terraform-aws-sns/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# AWS SNS Terraform module

## Description
This terraform module creates sns topic and associated resources.

Examples available [here](https://github.com/boldlink/terraform-aws-sns/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```hcl
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
```

## Documentation

[Amazon SNS Documentation](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)

[Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_sns_topic.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_failure_feedback_role_arn"></a> [application\_failure\_feedback\_role\_arn](#input\_application\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_application_success_feedback_role_arn"></a> [application\_success\_feedback\_role\_arn](#input\_application\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_application_success_feedback_sample_rate"></a> [application\_success\_feedback\_sample\_rate](#input\_application\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `string` | `null` | no |
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | (Optional) Enables content-based deduplication for FIFO topics. | `string` | `null` | no |
| <a name="input_create_kms_key"></a> [create\_kms\_key](#input\_create\_kms\_key) | Choose whether to create kms key for sns | `bool` | `false` | no |
| <a name="input_delivery_policy"></a> [delivery\_policy](#input\_delivery\_policy) | (Optional) The SNS delivery policy. | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | (Optional) The display name for the topic | `string` | `null` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Choose whether to enable key rotation | `bool` | `true` | no |
| <a name="input_fifo_topic"></a> [fifo\_topic](#input\_fifo\_topic) | (Optional) Boolean indicating whether or not to create a FIFO (first-in-first-out) topic (default is `false`). | `bool` | `false` | no |
| <a name="input_firehose_failure_feedback_role_arn"></a> [firehose\_failure\_feedback\_role\_arn](#input\_firehose\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_firehose_success_feedback_role_arn"></a> [firehose\_success\_feedback\_role\_arn](#input\_firehose\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_firehose_success_feedback_sample_rate"></a> [firehose\_success\_feedback\_sample\_rate](#input\_firehose\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `number` | `null` | no |
| <a name="input_http_failure_feedback_role_arn"></a> [http\_failure\_feedback\_role\_arn](#input\_http\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_http_success_feedback_role_arn"></a> [http\_success\_feedback\_role\_arn](#input\_http\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_http_success_feedback_sample_rate"></a> [http\_success\_feedback\_sample\_rate](#input\_http\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `string` | `null` | no |
| <a name="input_key_deletion_window"></a> [key\_deletion\_window](#input\_key\_deletion\_window) | The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. | `number` | `7` | no |
| <a name="input_kms_master_key_arn"></a> [kms\_master\_key\_arn](#input\_kms\_master\_key\_arn) | (Optional) The ARN of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. | `string` | `null` | no |
| <a name="input_lambda_failure_feedback_role_arn"></a> [lambda\_failure\_feedback\_role\_arn](#input\_lambda\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_lambda_success_feedback_role_arn"></a> [lambda\_success\_feedback\_role\_arn](#input\_lambda\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_lambda_success_feedback_sample_rate"></a> [lambda\_success\_feedback\_sample\_rate](#input\_lambda\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. For a FIFO (first-in-first-out) topic, the name must end with the `.fifo` suffix. If omitted, Terraform will assign a random, unique name. Conflicts with `name_prefix` | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional) Creates a unique name beginning with the specified prefix. Conflicts with `name` | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | (Optional) The fully-formed AWS policy as JSON. | `string` | `null` | no |
| <a name="input_sns_topic_subscriptions"></a> [sns\_topic\_subscriptions](#input\_sns\_topic\_subscriptions) | Resource block for sns topic subscriptions | `any` | `{}` | no |
| <a name="input_sqs_failure_feedback_role_arn"></a> [sqs\_failure\_feedback\_role\_arn](#input\_sqs\_failure\_feedback\_role\_arn) | (Optional) IAM role for failure feedback | `string` | `null` | no |
| <a name="input_sqs_success_feedback_role_arn"></a> [sqs\_success\_feedback\_role\_arn](#input\_sqs\_success\_feedback\_role\_arn) | (Optional) The IAM role permitted to receive success feedback for this topic | `string` | `null` | no |
| <a name="input_sqs_success_feedback_sample_rate"></a> [sqs\_success\_feedback\_sample\_rate](#input\_sqs\_success\_feedback\_sample\_rate) | (Optional) Percentage of success to sample | `number` | `null` | no |
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

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests:
`$ make tests`
* Clean all tests:
`$ make clean`

#### BOLDLink-SIG 2022
