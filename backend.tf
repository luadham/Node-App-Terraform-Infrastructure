terraform {
  backend "s3" {
    bucket         = "adham-terraform-state-us-east-1"
    key            = "node-app-tfstate.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}
