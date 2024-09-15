resource "kubernetes_deployment" "nginx_static" {
  metadata {
    name = "nginx-static"
    namespace = kubernetes_namespace.main_namespace.metadata.0.name
    labels = {
      app = "nginx-static"
    }
  }

  spec {
    replicas = 1  # Можно увеличить, если нужно больше инстансов
    selector {
      match_labels = {
        app = "nginx-static"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx-static"
        }
      }

      spec {
        container {
          name  = "nginx-static"
          image = "nginx:latest"

          port {
            container_port = 80
          }

          volume_mount {
            name       = "static-files"
            mount_path = "/usr/share/nginx/html"
          }
        }

        volume {
          name = "static-files"
          host_path {
            path = var.volume_dir
            type = "Directory"
          }
        }
      }
    }
  }
}