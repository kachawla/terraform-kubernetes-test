variable "redis_cache_name" {
  type        = string
}

variable "namespace" {
  description = "Namespace for deploying the Redis container"
  type        = string
  default     = "default"
}