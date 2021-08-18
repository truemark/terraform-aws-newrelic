variable "newrelic_account_id" {
  description = "The NewRelic Account-ID"
}

variable "name" {
  description = "Name of the IAM role to create. Default value is newrelic."
  default = "newrelic"
}

variable "path" {
  description = "Path in which to create the policy. See IAM Identifiers for more information. Default value is /terraform/newrelic/"
  default = "/terraform/newrelic/"
}