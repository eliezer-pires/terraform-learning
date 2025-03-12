terraform {
  backend "s3" {
    bucket         = "tf-learn-eliezerpires-bucket"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-dynamo-lock-state"
  }
}