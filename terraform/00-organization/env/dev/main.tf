module "namespace" {
  source = "./modules/organization"

  dev_account_email   = var.dev_account_email
  prod_account_email  = var.prod_account_email
  organization_name   = var.organization_name
  root_id             = var.root_id
  enable_all_features = var.enable_all_features

}
