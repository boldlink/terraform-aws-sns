[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-sns/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-sns.svg)](https://github.com/boldlink/terraform-aws-sns/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-sns/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-sns/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform module example with the complete and most common configuration

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.22.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application_feedback_role"></a> [application\_feedback\_role](#module\_application\_feedback\_role) | boldlink/iam-role/aws | 1.1.1 |
| <a name="module_complete_sns_topic"></a> [complete\_sns\_topic](#module\_complete\_sns\_topic) | ../../ | n/a |
| <a name="module_http_feedback_role"></a> [http\_feedback\_role](#module\_http\_feedback\_role) | boldlink/iam-role/aws | 1.1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue.example_dead_letter_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.sns_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns_topic_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Optional) The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. For a FIFO (first-in-first-out) topic, the name must end with the `.fifo` suffix. If omitted, Terraform will assign a random, unique name. Conflicts with `name_prefix` | `string` | `"complete-sns-example"` | no |

## Outputs

No outputs.
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

#### BOLDLink-SIG 2023
