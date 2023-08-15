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
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.12.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_complete_sns_topic"></a> [complete\_sns\_topic](#module\_complete\_sns\_topic) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |

## Inputs

No inputs.

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

#### BOLDLink-SIG 2022
