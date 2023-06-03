output "host" {
  value = "${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local"
}

output "port" {
  value = 6379
}

output "connectionString" {
  value = "redis://${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local:6379"
}