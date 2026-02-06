resource "kubernetes_ingress_v1" "app" {
  metadata {
    name = "devops-minikube-ingress"

    labels = {
      app = "devops-minikube-app"
    }
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = "devops.local"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "devops-minikube-service"

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
