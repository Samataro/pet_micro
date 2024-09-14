resource "kubernetes_ingress_v1" "static_ingress" {
  metadata {
    name = "static-ingress"
    namespace = var.namespace
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
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
          path = "/static/"  # Все запросы по пути /static/ будут направляться на сервис NGINX
          backend {
            service {
              name = kubernetes_service.nginx_static_service.metadata[0].name
              port {
                number = kubernetes_service.nginx_static_service.spec[0].port[0].port
              }
            }
          }
        }
      }
    }
  }
}