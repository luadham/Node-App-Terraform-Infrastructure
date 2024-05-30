terraform {
  backend "s3" {
    bucket         = "mybucket"
    key            = "node-app-tfstate.tfstate"
    region         = "us-east-1"
    dynamodb_table = ""
  }
}
