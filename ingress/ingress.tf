resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name = "static-ingress"
    namespace = var.namespace
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/$2"
    }
  }

  spec {
    tls {
      hosts = [var.main_host]
      secret_name = kubernetes_secret.tls.metadata[0].name
    }

    rule {
      host = var.main_host
      http {
        path {
          path = "/static(/|$)(.*)"  # Все запросы по пути /static/ будут направляться на сервис NGINX
          path_type = "Prefix"
          backend {
            service {
              name = "nginx-static-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    rule {
      host = var.main_host
      http {
        path {
          path = "/(.*)"
          path_type = "Prefix"
          backend {
            service {
              name = "api-gateway-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}