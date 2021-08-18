output "role_arn" {
  description = "The ARN of the generated NewRelic Role."
  value = aws_iam_role.newrelic.arn
}

output "role_name" {
  description = "The name of the generated NewRelic Role."
  value = aws_iam_role.newrelic.name
}

output "role_id" {
  description = "The ID of the generated NewRelic Role."
  value = aws_iam_role.newrelic.id
}

output "budget_policy_arn" {
  description = "The ARNs of the generated budget policy."
  value = join("", aws_iam_policy.budget.*.arn)
}
