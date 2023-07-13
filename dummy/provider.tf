terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.62.0"
    }
  }
  required_version = ">=1.0.0"
}

# terraform {

#     backend "azurerm"{

#     }
# }


provider "azurerm" {
  subscription_id = "6e54aa79-9b0b-40ed-ae27-91fdffa0a565"
  tenant_id       = "17a09c66-f406-4897-8b24-51f5313623dc"
  client_id       = "6589b09f-b35e-4dd2-86fc-d7a757d9f72e"
  client_secret   = "uEt8Q~bOJthtZLylI39GkKNrov7scwN2uf1MoaLU"
  features {
  }

}    