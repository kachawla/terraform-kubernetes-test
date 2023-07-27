output "host" {
  value = "${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local"
}

output "port" {
  value = 6379
}

output "connectionString" {
  value = "redis://${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local:6379"
  sensitive = true
}

output "values" {
  value = {
    host = "${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local",
    port = 6379,
  }
}

output "secrets" {
  value = {
    connectionString = "redis://${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local:6379"
  }
  sensitive = true
}

output "result" {
  value = {
    values = {
      host = "${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local"
      port = 6379
    }
    secrets = {
      connectionString = "redis://${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local:6379"
    }
  }
  sensitive = true
}
