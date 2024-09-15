variable "volume_dir" {
  type = string
  description = "Путь к директории с файлами на хост машине для статики"
  default = "/mnt/data/pet_go_microservices/static"
}

variable "namespace" {
    type = string
    description = "Namespace для всех ресурсов"
    default = "pet-microservices"
}