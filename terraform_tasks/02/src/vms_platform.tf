
variable "vm_web_ubuntu_version" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Distr"
}

variable "vm_web_name_of_vm" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of web VM"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform id"
}


#database
variable "vm_db_ubuntu_version" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Distr"
}

variable "vm_db_name_of_vm" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of db VM"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform id"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  description = "ssh-keygen -t ed25519"
  sensitive   =  true
}