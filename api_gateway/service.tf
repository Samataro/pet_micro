resource "kubernetes_service" "api_gateway" {
  metadata {
    name = "api-gateway-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "api-gateway"
    }

    port {
      protocol = "TCP"
      port     = 80
      target_port = 8080
    }

    type = "NodePort"
  }
}