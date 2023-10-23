locals {
  account_id        = data.aws_caller_identity.current.account_id
  kms_master_key_id = "alias/aws/sqs"
  role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:PutMetricFilter",
          "logs:PutRetentionPolicy"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}