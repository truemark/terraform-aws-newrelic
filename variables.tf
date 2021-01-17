variable "name" {
  description = "Name of the IAM role to create"
  default = "newrelic"
}

variable "path" {
  default = "/terraform/newrelic/"
}

variable "include_budget" {
  default = true
}
