data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}
data "aws_region" "current" {}

data "aws_iam_policy_document" "kms" {

  statement {
    sid = "AllowKMSPermissions"

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

      identifiers = [
        format(
          "logs.%s.amazonaws.com",
          data.aws_region.current.name
        )
      ]
    }

    resources = ["*"]
  }

  statement {
    sid = "EnableIAMUserPermissions"

    actions = [
      "kms:*",
    ]

    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        format(
          "arn:%s:iam::%s:root",
          data.aws_partition.current.partition,
          data.aws_caller_identity.current.account_id
        )
      ]
    }

    resources = ["*"]
  }
}
