terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "bookstore-rg"
  location = "Central US"   # Changed from East US
}

# App Service Plan
resource "azurerm_service_plan" "app_plan" {
  name                = "bookstore-app-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"   # Basic tier, supports Always On
}

# Linux Web App
resource "azurerm_linux_web_app" "app" {
  name                = "bookstore-webapp-demo"
  location            = azurerm_service_plan.app_plan.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {
    application_stack {
      python_version = "3.10"
    }
  }

  depends_on = [
    azurerm_service_plan.app_plan
  ]
}
