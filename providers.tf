terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
  backend "s3" {
  bucket = "devops09022023state"
  key    = "devenv/devops09022023.tfstate"
  region = "us-east-1"
}
}

