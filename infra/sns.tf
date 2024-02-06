resource "aws_sns_topic" "contact_form_topic" {
  name = "portfolio-contact-form-topic"
}

resource "aws_sns_topic_subscription" "contact_form_email" {
  topic_arn = aws_sns_topic.contact_form_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}
