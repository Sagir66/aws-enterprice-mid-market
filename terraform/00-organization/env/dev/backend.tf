terraform {

  backend "s3" {
    bucket         = "tf-backend-midmarket"
    key            = "00-organization/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }


}
