output "result" {
  value = {
    values = {
      host = "${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local"
      port = 6379
    }
    secrets = {
      connectionString = "${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc:6379"
    }
  }
  sensitive = true
}
