output "url" {
    value = "${aws_elastic_beanstalk_environment.development.cname}"
}