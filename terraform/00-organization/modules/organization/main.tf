

resource "aws_organizations_organization" "this" {
  feature_set = "ALL"
}

# ───── OUs ─────

resource "aws_organizations_organizational_unit" "security" {
  name      = var.organization_name
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "infrastructure" {
  name      = var.organization_name
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "workloads" {
  name      = var.organization_name
  parent_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "dev" {
  name      = var.organization_name
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_organizational_unit" "prod" {
  name      = var.organization_name
  parent_id = aws_organizations_organizational_unit.workloads.id
}

# ───── Accounts ─────

resource "aws_organizations_account" "logging" {
  name      = "Logging"
  email     = var.logging_account_email
  parent_id = aws_organizations_organizational_unit.security.id
}

resource "aws_organizations_account" "audit" {
  name      = "Audit"
  email     = var.audit_account_email
  parent_id = aws_organizations_organizational_unit.security.id
}

resource "aws_organizations_account" "network" {
  name      = "Network"
  email     = var.network_account_email
  parent_id = aws_organizations_organizational_unit.infrastructure.id
}

resource "aws_organizations_account" "sharedservices" {
  name      = "SharedServices"
  email     = var.scharred_services_account_email
  parent_id = aws_organizations_organizational_unit.infrastructure.id
}

resource "aws_organizations_account" "devapp1" {
  name      = "DevApp1"
  email     = var.dev_account_email
  parent_id = aws_organizations_organizational_unit.dev.id
}

resource "aws_organizations_account" "devapp2" {
  name      = "DevApp2"
  email     = var.dev_account_email
  parent_id = aws_organizations_organizational_unit.dev.id
}

resource "aws_organizations_account" "prodapp1" {
  name      = "ProdApp1"
  email     = var.prod_account_email
  parent_id = aws_organizations_organizational_unit.prod.id
}
