variable "project" {
  type    = string
  default = "byam-portfolio"
}

variable "aws_account_id" {
  type    = string
  default = "487434353684"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "domain_name" {
  type    = string
  default = "byambasuren.com"
}

variable "api_domain_name" {
  type    = string
  default = "api.byambasuren.com"
}

variable "domain_name_www" {
  type    = string
  default = "www.byambasuren.com"
}

variable "email_address" {
  description = "Email address to receive notifications"
  default     = "bya.mng@gmail.com"
}
