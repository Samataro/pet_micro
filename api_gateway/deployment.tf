resource "kubernetes_deployment" "api_gateway" {
  metadata {
    name = "api-gateway"
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "api-gateway"
      }
    }

    template {
      metadata {
        labels = {
          app = "api-gateway"
        }
      }

      spec {
        container {
          name  = "api-gateway"
          image = "pet-go-microservices-api-gateway:0.0.5"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}