terraform {
  required_version = ">= 1.7.2"

  backend "s3" {
    bucket = "byam-portfolio-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
