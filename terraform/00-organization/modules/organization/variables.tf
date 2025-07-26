variable "dev_account_email" {
  description = "Email address for the development account"
  type        = string

}

variable "prod_account_email" {
  description = "Email address for the production account"
  type        = string
}
variable "organization_name" {
  description = "Name of the AWS Organization"
  type        = string
  default     = "MyOrganization"
}

variable "root_id" {
  description = "Root ID for the AWS Organization, if applicable"
  type        = string
  default     = null
}
variable "enable_all_features" {
  description = "Enable all features for the AWS Organization"
  type        = bool
  default     = true
}


variable "scharred_services_account_email" {
  description = "Email address for the Shared Services account"
  type        = string
}

variable "network_account_email" {
  description = "Email address for the Network account"
  type        = string
}
variable "audit_account_email" {
  description = "Email address for the Audit account"
  type        = string
}
variable "logging_account_email" {
  description = "Email address for the Logging account"
  type        = string
}
