output "dev_account_id" {
  description = "The ID of the development account"
  value       = aws_organizations_account.dev_account.id
}
output "prod_account_id" {
  description = "The ID of the production account"
  value       = aws_organizations_account.prod_account.id
}
