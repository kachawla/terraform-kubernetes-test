variable "context" {
  description = "This variable contains Radius recipe context."

  type = any
}

variable "port" {
  type = number
  description = "Container port for the Redis instance."
}
