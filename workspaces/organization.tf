resource "tfe_organization" "test" {
  name  = var.org_name
  email = var.org_email
}
