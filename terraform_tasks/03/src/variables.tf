###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}
variable "vm_ubuntu_version" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Distr"
}
variable "vm_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform id"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    "web" = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    },
  }
}

variable "each_vm" {
  type = map(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
  default = {
    "first" = {
      vm_name     = "main",
      cpu         = 2,
      ram         = 1,
      disk_volume = 1
    }, 
    "second" = {
      vm_name     = "replica",
      cpu         = 2,
      ram         = 2,
      disk_volume = 1
    } 
  }
}


