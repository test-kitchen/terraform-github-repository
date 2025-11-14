terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.0.0"

  cloud {
    organization = "test-kitchen"
    workspaces {
      name = "terraform-github-repository"
    }
  }
}

provider "github" {
  owner = "test-kitchen"
}
