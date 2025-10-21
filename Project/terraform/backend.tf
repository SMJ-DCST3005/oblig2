# Backend configuration provided via -backend-config flag
# Backend block flexible for different environments
terraform {
  backend "azurerm" {
    # Configuration provided via backend-configs/*.tfvars
  }
}
