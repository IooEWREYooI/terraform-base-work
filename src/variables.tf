###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

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

# variable   "metadata"  {
#   default = {
#      serial-port-enable = 1
#      ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHgAWJRB1phor3yFZd/GZBaVIZUzYc8KyrpSzQnEH7lJ user@worknout"
#    }
# }

locals {

metadata = {
    serial-port-enable = 1
    ssh-keys = "${file("id_ed25519.pub")}" 
   }
}



variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
  default = [
    {vm_name="main"
     cpu=2
     ram=4
     disk_volume=10
    },
    {
       vm_name="replica"
       cpu=2
       ram=4
       disk_volume=10
    }]
}