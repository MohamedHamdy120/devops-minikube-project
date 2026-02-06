resource "kubernetes_service_v1" "app" {
  metadata {
    name = "devops-minikube-service"

    labels = {
      app = "devops-minikube-app"
    }
  }

  spec {
    selector = {
      app = "devops-minikube-app"
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "ClusterIP"
  }
}
