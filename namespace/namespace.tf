resource "kubernetes_namespace" "pet_microservices" {
  metadata {
    name = var.namespace
  }
}