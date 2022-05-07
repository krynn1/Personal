resource "aws_elastic_beanstalk_application" "jfordtest" {
  name        = "jford124"
  description = "tf-test-desc"
}

resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "jfordtestenv124"
  application         = aws_elastic_beanstalk_application.jfordtest.name
  solution_stack_name = "64bit Windows Server Core 2019 v2.8.3 running IIS 10.0"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
}
/*resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "2.2.11"
  application = "jford_test_env124"
  description = "application version created by terraform"
  bucket      = aws_s3_bucket.b.id
  key         = aws_s3_bucket_object.example.id
}*/