variable "main_host" {
  type = string
  description = "Основной домен"
  default = "example.org"
}

variable "namespace" {
  type = string
  description = "Namespace для всех ресурсов"
  default = "pet-microservices"
}