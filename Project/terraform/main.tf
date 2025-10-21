# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
    Owner       = "smj"
  }
}

# Storage Account
resource "azurerm_storage_account" "main" {
  name                = "sa${var.project_name}${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  account_tier             = var.sa_tier
  account_replication_type = var.sa_replication_type
  min_tls_version          = "TLS1_2"

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
    Owner       = "smj"
  }
}

# Storage Container
resource "azurerm_storage_container" "demo" {
  name                  = "oblig2-data-smj"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}
