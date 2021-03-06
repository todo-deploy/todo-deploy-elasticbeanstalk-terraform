variable "cluster_name" {
  default = "todo-cluster"
}
variable "cluster_tier" {
  default = "M2"
}
variable "mongodb_atlas_username" {}
variable "mongodb_atlas_api_key" {}
variable "database_user_test_username" { default = "todouser" }
variable "database_user_test_password" { default = "mongodb" }
variable "database_user_test_db_name" { default = "todo" }
variable "mongodb_atlas_org_id" {}
variable "project_name" {
  description = "Name of project in MongoDB Atlas"
  default = "tododeploy"
}
variable "whitelist_cidr_block" { default = "0.0.0.0/0" }
