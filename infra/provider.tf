provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "${var.project}"
    }
  }
}
