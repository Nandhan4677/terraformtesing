provider "azurerm" {
    version = 1.38
    }
resource "azurerm_storage_account" "lab" {
  name                     = "nandhanreddy89"
  resource_group_name      = "terraformtest1"
  location                 = "East US"
  account_tier            = "basic"
  account_replication_type = "LRS"

   tags = {
    environment = "Terraform Storage"
    CreatedBy = "Admin"
      }
  }
resource "azurerm_app_service_plan" "nandhansp" {
  name                = "nandhanserviceplan"
  location            = "eastus"
  resource_group_name = "terraform-assesment"

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "nandhanas" {
  name                = "nandhanappservice"
  location            = "eastus"
  resource_group_name = "terraform-assesment"
  app_service_plan_id = azurerm_app_service_plan.nandhansp.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}