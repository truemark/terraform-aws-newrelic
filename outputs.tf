output "role_arn" {
  value = aws_iam_role.newrelic.arn
}

output "role_name" {
  value = aws_iam_role.newrelic.name
}

output "role_id" {
  value = aws_iam_role.newrelic.id
}

output "budget_policy_arn" {
  value = join("", aws_iam_policy.budget.*.arn)
}
