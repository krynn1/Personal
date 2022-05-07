/*resource "aws_iam_instance_profile" "test_profile" {
  name = "IamInstanceProfile"
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = "aws-elasticbeanstalk-ec2-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}*/