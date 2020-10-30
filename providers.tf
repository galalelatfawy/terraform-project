provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  alias  = "east"
  region = "us-east-1"
}