module "repository" {
  version = "0.0.4"
  source  = "damacus/github-repository/module"

  for_each              = { for repo in var.repository : repo.name => repo }
  name                  = each.value.name
  repo_type             = each.value.repo_type != null ? each.value.repo_type : "ruby_gem"
  description_override  = each.value.description_override
  homepage_url_override = each.value.homepage_url_override
  additional_topics = compact(
    concat(local.default_gem_topics, each.value.additional_topics != null ? each.value.additional_topics : [""])
  )
  additional_status_checks = each.value.additional_status_checks != null ? each.value.additional_status_checks : []
  projects_enabled         = each.value.projects_enabled
}

variable "repository" {
  type = list(object({
    name                     = string
    repo_type                = string
    description_override     = optional(string)
    homepage_url_override    = optional(string)
    additional_topics        = optional(list(string)),
    additional_status_checks = optional(list(string))
    projects_enabled         = optional(bool)
  }))
  description = "The repositories to create."
}

locals {
  default_gem_topics = ["ruby", "ruby-gem", "hacktoberfest", "test-kitchen", "testing"]
}
