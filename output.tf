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
