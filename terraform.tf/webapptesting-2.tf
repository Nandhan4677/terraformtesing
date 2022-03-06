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
resource "azurerm_resource_group" "terraform-assesment1" {
  name                     = "terraform-assesment"
  location                 = "East US"
}

resource "azurerm_storage_account" "nandhan" {
  name                     = "nandhanreddy89"
  resource_group_name      = "terraform-assesment"
  location                 = "East US"
  account_tier            = "standard"
  account_replication_type = "LRS"

   tags = {
    environment = "Terraform Storage"
    CreatedBy = "Admin"
      }
  }
resource "azurerm_app_service_plan" "nandhansp1" {
  name                = "nandhanserviceplan"
  location            = "East US"
  resource_group_name = "terraform-assesment"

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "nandhanas1" {
  name                = "nandhanappservice"
  location            = "East US"
  resource_group_name = "terraform-assesment"
  app_service_plan_id = azurerm_app_service_plan.nandhansp1.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
