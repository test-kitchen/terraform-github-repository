terraform {
  // Enabled so we can have optionals in our objects,
  // see: https://github.com/hashicorp/terraform/issues/19898
  experiments = [module_variable_optional_attrs]
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.0.0"

  backend "remote" {
    organization = "test-kitchen"
    workspaces {
      name = "terraform-github-repository"
    }
  }
}

provider "github" {
  owner = "test-kitchen"
}
