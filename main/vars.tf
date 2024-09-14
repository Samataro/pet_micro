variable "volume_dir" {
  type = string
  description = "Путь к директории с файлами на хост машине для статики"
  default = "/mnt/data/pet_go_microservices/static"
}

variable "main_host" {
  type = string
  description = "Основной домен"
  default = "example.org"
}

variable "namespace" {
    type = string
    description = "Namespace для всех ресурсов"
    default = "pet-go-microservices"
}