variable "region" {
  description = "provisioned resources region"
  type = string
}
variable "service_name" {
  description = "ECS service name"
  type = string
}

variable "cluster_name" {
  description = "ECS Cluster name"
  type = string
}

variable "vpc_id" {
  description = "VPC ID where resources are going to be provisioned"
  type = string
}

variable "private_subnets" {
  description = "Private Subnet iDs where service is being deployed"
  type = list(string)
}

variable "service_port" {
  description = "Port where service is going to be available"
  type = string
}

variable "service_cpu" {
  description = "CPU allocated for service (CPU unit)"
  type = number
}

variable "service_memory" {
  description = "Memory allocated ofr service (MB unit)"
  type = number
}

variable "service_listener" {
  description = "Application load balancer listener ARN used by service"
  type = string
}

variable "service_task_execution_role" {
  description = "ARN of the ECS task execution role that the service is going to use to run"
}

variable "service_healthcheck" {
  description = "Service health check configuration, including protocol and path"
  type        = map(any)
}

variable "environment_variables" {
  type = list(object({
    name : string
    value : string
  }))
  description = "Service environment variables."
  default     = []
}

variable "capabilities" {
  description = "Service capabilities as EC2 or FARGATE"
  type = list(any)
}

variable "service_launch_type" {
  description = "Lauch type configurations configureted by capacity providers"
}

variable "service_task_count" {
  description = "Number of instances to be executed simultaneously by the service"
  type = number
}

variable "service_hosts" {
  description = "List of hosts associated to the service"
  type = list(string)
}