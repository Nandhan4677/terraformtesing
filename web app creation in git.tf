provider "azurerm" {
    version = 1.38
    }
    resource "azurerm_storage_account" "nandhanstacc" {
  name                = "storageacctest"
  location            = "eastus"
  resource_group_name = "terraform-assesment"
sku {
    tier = "Standard"
    size = "S1"
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

resource "azurerm_container_registry" "nandhanacr" {
  name                = "nandhanacr"
  location            = "eastus"
  resource_group_name = "terraform-assesment"
   
}