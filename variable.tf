variable "terraform-assesment" {
  default     = "terraform-resource-group"
  description = "The prefix used for all resources in this example"
}
variable "nandhanreddy89" {
    default   = "teffaform-storage-account"
    descrdescription = "the name of storage account"  
}

variable "nandhanserviceplan" {
    default    = "terraform-app-service-plan"
    description = "the name of app service plan"
  
}

variable "nandhanappservice" {
  default     = "terraform-app-service"
  description = "The name of the Web App"
}

variable "East US" {
  default     = "East US"
  description = "The Azure location where all resources in this example should be created"
}