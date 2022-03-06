terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "storage-account" {
  name                     = "nandhanreddy89"
  resource_group_name      = "terraform1"
  location                 = "East US"
  account_tier            = "standard"
  account_replication_type = "LRS"

   tags = {
    environment = "Terraform Storage"
    CreatedBy = "Admin"
      }
  }
resource "azurerm_app_service_plan" "app-service-plan" {
  name                = "nandhanserviceplan"
  location            = "East US"
  resource_group_name = "terraform1"

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "app-service" {
  name                = "nandhanappservice"
  location            = "East US"
  resource_group_name = "terraform1"
  app_service_plan_id = azurerm_app_service_plan.app-service-plan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
resource "azurerm_container_registry" "acr" {
  name                     = "nandhancontainer"
  location                 = "East US"
  resource_group_name      = "terraform1" 
  sku                      = "Basic"
}
