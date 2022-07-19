######################
## data sources
######################
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}
data "aws_region" "current" {}


data "aws_iam_policy_document" "kms" {

  statement {
    sid = "Allow KMS Permissions"

    actions = [
      "kms:Encrypt*",
      "kms:Decrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Describe*"
    ]

    effect = "Allow"

    principals {
      type = "Service"

      identifiers = ["logs.${local.region}.${local.dns_suffix}"]
    }

    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "kms:CallerAccount"
      values   = [local.account_id]
    }
  }

  statement {
    sid = "Enable IAM User Permissions"

    actions = [
      "kms:*",
    ]

    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = ["arn:${local.partition}:iam::${local.account_id}:root"]
    }

    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "kms:CallerAccount"
      values   = [local.account_id]
    }
  }
}
