terraform {
  backend "s3" {
    bucket = "todo-deploy-state"
    key    = "elastic-beanstalk"
    region = "us-east-1"
  }
}