resource "tfe_workspace" "test" {
  for_each = toset(var.env)
  name           = "data-resources-${each.value}"
  organization   = tfe_organization.test.name
  working_directory = "Azure_terraform/Data resources"
  vcs_repo {
    identifier = ""
    oauth_token_id = ""
  }
}