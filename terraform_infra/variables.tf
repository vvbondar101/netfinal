###cloud vars

variable "image_name" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "yandex compute image name"
}
variable "image_id" {
  type        = string
  default     = "fd8bkgba66kkf9eenpkb"
  description = "yandex compute image id"
}

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

variable "zone1a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "final_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "sg_name" {
  type        = string
  default     = "sgfinal"
  description = "SG name"
}
variable "vpc_name" {
  type        = string
  default     = "final01"
  description = "VPC network & subnet name"
}

variable "final01net" {
  type        = string
  default     = "final01"
  description = "VPC network & subnet name"
}

