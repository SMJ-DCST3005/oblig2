variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test, or prod."
  }
}

variable "sa_tier" {
  description = "The performance tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "sa_replication_type" {
  description = "The replication type of the storage account"
  type        = string
  default     = "LRS"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "westeurope"
}

variable "project_name" {
  description = "Project name used in resource naming"
  type        = string
  default     = "oblig2smj"
}
