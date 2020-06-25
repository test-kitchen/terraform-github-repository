resource "github_team" "admins" {
  name        = "admins"
  description = "Admins of the test-kitchen org"
  privacy     = "closed"
}

resource "github_membership" "cheeseplus" {
  username = "cheeseplus"
  role     = "admin"
}

resource "github_team_membership" "admins" {
  team_id  = github_team.admins.id
  username = "cheeseplus"
  role     = "maintainer"
}
