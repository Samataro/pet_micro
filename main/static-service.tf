resource "kubernetes_service" "nginx_static_service" {
  metadata {
    name = "nginx-static-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "nginx-static"
    }

    port {
      port        = 80       # Внешний порт
      target_port = 80       # Порт контейнера NGINX
    }

    type = "ClusterIP"  # Это будет внутренний сервис, доступный через Ingress
  }
}