# trust relationships for ec2
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# IAM role 
resource "aws_iam_role" "role" {
  name               = "ec2-role-access-s3"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# policy in json data
data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
  }
}

# IAM policy with required permissions exist in data
resource "aws_iam_policy" "policy" {
  name        = "ec2-policy-access-s3"
  description = "A test policy"
  policy      = data.aws_iam_policy_document.policy.json
}

# Attch the policy with role
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

# EC2 instance profile
resource "aws_iam_instance_profile" "test_profile" {
  name = "s3_access_profil"
  role = aws_iam_role.role.name
}