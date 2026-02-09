resource "kubernetes_secret_v1" "app_secrets" {
  metadata {
    name      = "devops-app-secrets"
    namespace = "default"
  }

  data = {
    MONGO_URI = "mongodb+srv://appuser:app-password@cluster0.example.mongodb.net/appdb"
  }

  type = "Opaque"
}

resource "kubernetes_deployment_v1" "app" {
  depends_on = [
    kubernetes_secret_v1.app_secrets
  ]

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
          
          env {
          name = "MONGO_URI"

          value_from {
            secret_key_ref {
              name = kubernetes_secret_v1.app_secrets.metadata[0].name
              key  = "MONGO_URI"
            }
          }
        }


        }
      }
    }
  }
}
