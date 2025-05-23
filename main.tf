terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

resource "random_uuid" "name" {
}

resource "kubernetes_deployment" "redis" {
  metadata {
    name = "redis-${random_uuid.name.result}"
    namespace = var.context.runtime.kubernetes.namespace
    labels = {
      app = "redis"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "redis"
      }
    }

    template {
      metadata {
        labels = {
          app = "redis"
        }
      }

      spec {
        container {
          name  = "redis"
          image = "redis:latest" 
          port {
            container_port = var.context.resource.properties.port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "redis" {
  metadata {
    name = "redis-${random_uuid.name.result}"
    namespace = var.context.runtime.kubernetes.namespace
  }

  spec {
    selector = {
      app = "redis"
    }

    port {
      port        = var.context.resource.properties.port  # Service port
      target_port = var.context.resource.properties.port  # Target port of the Redis deployment
    }
  }
}
