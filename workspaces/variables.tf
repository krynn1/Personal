variable "token" {
  default = ""
  sensitive = true

}
variable "env" {
  default = ["dev", "qa", "prod"]
}
resource "tfe_variable" "env" {
  for_each = toset(var.env)
  key             = "env"
  value           = each.key
  category        = "env"
  description     = "env"
  #variable_set_id = tfe_variable_set.test.id
  workspace_id    = tfe_workspace.test[each.value].id
}
variable "org_name" {
  default = "jford_test"
}
variable "org_email" {
  default = "jason.ford01@gmail.com"
}
variable "oauth" {
  default   = ""
  sensitive = true
}
variable "client_id" {
  default = ""
  sensitive = true
}
variable "client_secret" {
  default = ""
  sensitive = true
}
variable "subscription_id" {
  default = ""
  sensitive = true
}
variable "tenant_id" {
  default = ""
  sensitive = true
}
resource "tfe_variable" "ARM_CLIENT_ID" {
  for_each = toset(var.env)
  key             = "ARM_CLIENT_ID"
  value           = var.client_id
  category        = "env"
  description     = "client_id"
  #variable_set_id = tfe_variable_set.test.id
  workspace_id    = tfe_workspace.test[each.value].id
  sensitive = true
}
resource "tfe_variable" "ARM_CLIENT_SECRET" {
  for_each = toset(var.env)
  key             = "ARM_CLIENT_SECRET"
  value           = var.client_secret
  category        = "env"
  description     = "client_secret"
  #variable_set_id = tfe_variable_set.test.id
  workspace_id    = tfe_workspace.test[each.value].id
  sensitive = true
}
resource "tfe_variable" "ARM_TENANT_ID" {
  for_each = toset(var.env)
  key             = "ARM_TENANT_ID"
  value           = var.tenant_id
  category        = "env"
  description     = "tenant_id"
  #variable_set_id = tfe_variable_set.test.id
  workspace_id    = tfe_workspace.test[each.value].id
  sensitive = true
}
resource "tfe_variable" "ARM_SUBSCRIPTION_ID" {
  for_each = toset(var.env)
  key             = "ARM_SUBSCRIPTION_ID"
  value           = var.subscription_id
  category        = "env"
  description     = "subscription_id"
  #variable_set_id = tfe_variable_set.test.id
  workspace_id    = tfe_workspace.test[each.value].id
  sensitive = true
}