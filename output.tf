output "result" {
  value = {
    resources = ["/planes/kubernetes/local/namespaces/${kubernetes_service.redis.metadata[0].namespace}/providers/core/Service/${kubernetes_service.redis.metadata[0].name}"]
    values = {
      host = "${kubernetes_service.redis.metadata[0].name}.${kubernetes_service.redis.metadata[0].namespace}.svc.cluster.local"
      port = 6379
    }
  }
}
