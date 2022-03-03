# terraform-github-org

## Usage

## Becoming A Member

Add yourself to `membership.tf`

## Adding a Repository

Add a new entry to `terraform.tfvars.json`

```json
{
  "name": "azurerm",
  "repo_type": "ruby_gem"
},
```

## Importing a repository

Note: **Board Members only**

- Create a new entry in terraform.tfvars.json
- Import the state file using:

    ```bash
    terraform import 'module.repository["<repository>"].github_repository.this' <repository>
    ```

Then get the pull request merged in, not merging in the PR will result in terraform **deleting** the repo on next run
