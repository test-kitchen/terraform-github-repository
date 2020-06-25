# terraform-github-org

## Usage

## Becoming A Member

Add yourself to `membership.tf`

## Adding a Repository

Create a file called `repository.tf` where repository is the name of your repository e.g. `kitchen-foo.tf`

Example repository with one maintainer.

```hcl
module "kitchen-foo" {
  source         = "./modules/repository"
  name           = "kitchen-foo"
  description    = "Development repository for the kitchen-foo driver"
  repository_team  = "${github_team.kitchen-foo.id}"

}

resource "github_team" "kitchen-foo" {
  name        = "kitchen-foo"
  description = "kitchen-foo Driver Maintainers"
  privacy     = "closed"
}

resource "github_team_membership" "kitchen-foo-maintainer-Username" {
  team_id  = "${github_team.kitchen-foo.id}"
  username = "Username"
  role     = "member"
}
```

## Becoming a Repo Maintainer

Add yourself to the repository file e.g. `test-kitchen.tf`

All terraform resource names must be unique. The easiest way to do this is

- copy the previous resource
- change their name to yours

## Importing a repository

Note: **Board Members only**
Create the terraform file for the repository
import the state file using:

```bash
terraform import module.kitchen-foo.github_repository.repository kitchen-foo
```

Then get the pr merged in, not merging in the PR will result in terraform **deleting** the repo on next run
