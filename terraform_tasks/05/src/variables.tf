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

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"  
}

variable "ubuntu_version" {
  type = string
  default = "ubuntu-2004-lts"
  validation {
    condition = contains(["ubuntu-2004-lts"], var.ubuntu_version)
    error_message = "Ubuntu version isn't compatible"
  }
}

variable "ip" {
  type = string
  default = "192.168.100.2"
  description = "ip address"

  validation {
    condition = cidrhost("192.168.100.0/24", 2) == var.ip
    error_message = "IP invalid"
  }
}

variable "ip_list" {
  type = list(string)
  default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  description = "list of ip"

  validation {    
    condition = alltrue([
      for ip in var.ip_list : 
         contains(["192.168.0.1", "1.1.1.1", "127.0.0.1"], ip)])
    error_message = "is not ok"
  }
}

variable "some_string" {
  type = string
  default = "string with character in upper case"
  description = "Any string"

  validation {
    condition = !can(regex("[A-Z]", var.some_string))
    error_message = "String with character which uppercase"
  }
}

variable "only_one" {
    description="Who is better Connor or Duncan?"
    type = object({
        Dunkan = optional(bool)
        Connor = optional(bool)
    })

    default = {
        Dunkan = true
        Connor = false
    }

    validation {
        error_message = "There can be only one MacLeod"
        condition = !var.only_one.Dunkan == var.only_one.Connor || var.only_one.Dunkan == !var.only_one.Connor
    }
}

