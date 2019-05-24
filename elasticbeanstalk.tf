provider "aws" {
    region  = "us-east-1"
}

resource "aws_elastic_beanstalk_application" "todo-deploy" {
  name = "todo-deploy"
}
resource "aws_elastic_beanstalk_environment" "development" {
  name                = "development"
  application         = "${aws_elastic_beanstalk_application.todo-deploy.name}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v4.8.3 running Node.js"

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "DB"
    value = "${mongodbatlas_cluster.test.srv_address}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "DB_NAME"
    value = "${var.database_user_test_db_name}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "DB_USER"
    value = "${var.database_user_test_username}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "DB_PASS"
    value = "${var.database_user_test_password}"
  }
}
resource "aws_s3_bucket" "todo-deploy-packages" {
  bucket = "todo-deploy-packages"
}

resource "aws_s3_bucket_object" "todo-deploy-object" {
  bucket = "${aws_s3_bucket.todo-deploy-packages.id}"
  key    = "todo-app.zip"
  source = "todo-app.zip"
}

resource "aws_elastic_beanstalk_application_version" "version" {
  name        = "version"
  application = "${aws_elastic_beanstalk_application.todo-deploy.id}"
  bucket      = "${aws_s3_bucket.todo-deploy-packages.id}"
  key         = "${aws_s3_bucket_object.todo-deploy-object.id}"
}
