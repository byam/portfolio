terraform {
  required_version = ">= 1.4.5"

  backend "s3" {
    bucket = "byam-portfolio-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
