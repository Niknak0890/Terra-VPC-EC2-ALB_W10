terraform {
  backend "s3" {
    bucket         = "w10bucket-na" #bucket name
    key            = "week10/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "w10db" #db table name
  }
}