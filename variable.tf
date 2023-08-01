variable "client_id" {
  type        = string
  description = "client_id"
  default     = "319bc0c9-ae06-4fad-ad90-6cd31b8d1f48"
}

variable "tenant_id" {
  type        = string
  description = "tenant_id"
  default     = "f2b21b53-f648-4e29-947d-096e2b5c4257"
}

variable "client_secret" {
  type        = string
  description = "client_secret"
  default     = "M.58Q~HDZWTarkRNm03~K2ERYS3dV~HrvZz7ucjO"
}

variable "subscription_id" {
  type        = string
  description = "subscription_id"
  default     = "aed6689b-aff7-462e-bc0b-d348f25b8941"
}

variable "resourcegroupname" {
  type        = string
  description = "Name of the resource group"
  default     = "VM-RG"
}

variable "storageaccountname" {
  type        = string
  description = "Name of the storage account"
  default     = "hanustorageaccount1234"
}

variable "virtualnetwork" {
  type        = string
  description = "Name of the Virtual network"
  default     = "Hanu-Vnet"
}

variable "subnet" {
  type        = string
  description = "Name of the subnet"
  default     = "Hanu-Snet"
}
