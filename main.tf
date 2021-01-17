data "aws_caller_identity" "current" {}


locals {
  newrelic_account_id = "754728514883"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    condition {
      test = "StringEquals"
      values = [
        var.newrelic_account_id
      ]
      variable = "sts:ExternalId"
    }

    principals {
      identifiers = [
        local.newrelic_account_id
      ]
      type = "AWS"
    }
  }
}


resource "aws_iam_role" "newrelic" {
  name = var.name
  path = var.path
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "read_only" {
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role = aws_iam_role.newrelic.name
}

data "aws_iam_policy_document" "budget" {
  count = var.include_budget ? 1 : 0
  statement {
    effect = "Allow"
    actions = [
      "budgets:ViewBudget"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "budget" {
  count = var.include_budget ? 1 : 0
  name = "${var.name}-budget"
  path = var.path
  policy = data.aws_iam_policy_document.budget[count.index].json
}

resource "aws_iam_role_policy_attachment" "budget" {
  count = var.include_budget ? 1 : 0
  policy_arn = aws_iam_policy.budget[count.index].arn
  role = aws_iam_role.newrelic.name
}
