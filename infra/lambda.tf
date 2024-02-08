resource "aws_lambda_function" "contact_form_handler" {
  function_name = "contactFormHandler"

  // Assuming your Lambda code is in a directory named "lambda" and the main file is index.js
  filename         = "../lambda/contact2mail.zip"
  source_code_hash = filebase64sha256("../lambda/contact2mail.zip")
  handler          = "index.handler"
  runtime          = "nodejs14.x"

  environment {
    variables = {
      SNS_TOPIC_ARN = aws_sns_topic.contact_form_topic.arn
    }
  }

  role = aws_iam_role.lambda_exec_role.arn

  lifecycle {
    ignore_changes = ["source_code_hash"]
  }
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "portfolio_lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow",
      Sid    = ""
    }]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_exec_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "sns:Publish"
        ],
        Resource = "*",
        Effect   = "Allow"
      }
    ]
  })
}
