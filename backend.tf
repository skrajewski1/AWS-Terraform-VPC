terraform {
  backend "s3" {
    bucket         = "sck-terraform"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "state-log"
  }
}
