provider "github" {
     token = var.githubToken
}

provider "aws" {
  region = local.region
}