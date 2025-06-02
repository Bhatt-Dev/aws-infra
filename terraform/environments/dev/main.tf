# Setting up aws identity and region data sources
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# ==========================================================================
# Setting up the S3 bucket for remote state management
resource "aws_s3_bucket" "bhattdev_tf_state_bucket" {
  bucket = "${var.remote_state_bucket}-${var.environment}"
}

resource "aws_s3_bucket_versioning" "bhattdev_tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.bhattdev_tf_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bhattdev_tf_state_bucket_encryption" {
  bucket = aws_s3_bucket.bhattdev_tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "bhattdev_tf_state_bucket_policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:GetBucketVersioning",
      "s3:PutBucketVersioning",
      "s3:GetEncryptionConfiguration",
      "s3:PutEncryptionConfiguration"
    ]
    resources = [
      "${aws_s3_bucket.bhattdev_tf_state_bucket.arn}/*",
      aws_s3_bucket.bhattdev_tf_state_bucket.arn
    ]
  }
}

resource "aws_iam_policy" "bhattdev_tf_state_bucket_policy" {
  name   = "bhattdev-tf-state-bucket-policy-${var.environment}"
  policy = data.aws_iam_policy_document.bhattdev_tf_state_bucket_policy.json
}

resource "aws_iam_role" "bhattdev_tf_state_role" {
  name = "bhattdev-tf-state-role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.AWS_ACCOUNT_ID}:root"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  role       = aws_iam_role.bhattdev_tf_state_role.name
  policy_arn = aws_iam_policy.bhattdev_tf_state_bucket_policy.arn
}

# ==========================================================================
# Setting up the OIDC based Role provider for AWS
resource "aws_iam_role" "bhattdev_github_actions_role" {
  name = "bhattdev-github-actions-role-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::${var.AWS_ACCOUNT_ID}:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          "ForAllValues:StringLike" = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_organization}/*:*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "bhattdev_github_actions_policy_attachment" {
  role       = aws_iam_role.bhattdev_github_actions_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}