resource "kubernetes_deployment_v1" "app" {
  metadata {
    name = "devops-minikube-app"
    labels = {
      app = "devops-minikube-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "devops-minikube-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "devops-minikube-app"
        }
      }

      spec {
        container {
          name  = "devops-minikube-app"
          image = "devops-minikube-app:v1"

          image_pull_policy = "IfNotPresent"

          port {
            container_port = 3000
          }

          env {
            name  = "PORT"
            value = "3000"
          }
        }
      }
    }
  }
}
