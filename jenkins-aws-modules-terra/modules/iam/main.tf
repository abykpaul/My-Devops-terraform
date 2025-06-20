
resource "aws_iam_role" "ec2_role" {
  name               = "ec2-role-${var.env}" # dev, prod, etc.
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-profile-${var.env}"
  role = aws_iam_role.ec2_role.name
}
