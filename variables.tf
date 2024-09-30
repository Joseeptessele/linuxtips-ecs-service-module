variable "region" {
  description = "provisioned resources region"
  type        = string
}
variable "service_name" {
  description = "ECS service name"
  type        = string
}

variable "cluster_name" {
  description = "ECS Cluster name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where resources are going to be provisioned"
  type        = string
}

variable "private_subnets" {
  description = "Private Subnet iDs where service is being deployed"
  type        = list(string)
}

variable "service_port" {
  description = "Port where service is going to be available"
  type        = number
}

variable "service_cpu" {
  description = "CPU allocated for service (CPU unit)"
  type        = number
}

variable "service_memory" {
  description = "Memory allocated ofr service (MB unit)"
  type        = number
}

variable "service_listener" {
  description = "Application load balancer listener ARN used by service"
  type        = string
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
  type        = list(any)
}

# variable "service_launch_type" {
#   description = "ECS launch type: ECS or FARGATE"
#   type = string
# }

variable "service_launch_type" {
  type = list(object({
    capacity_provider = string
    weight = number
  }))
  default = [ {
    capacity_provider = "FARGATE_SPOT"
    weight = 100
  } ]
}

variable "service_task_count" {
  description = "Number of instances to be executed simultaneously by the service"
  type        = number
}

variable "service_hosts" {
  description = "List of hosts associated to the service"
  type        = list(string)
}

variable "scale_type" {
  description = "Value for scale type. Currently supported values are: requests_tracking, cpu and cpu_tracking"
  default = null
}

variable "task_minimum" {
  description = "ECS minimum number of running tasks"
  default = 3
}

variable "task_maximum" {
  description = "ECS maximum number of running tasks"
  default = 10
}

### CPU AUTOSCALING

variable "scale_out_cpu_threshold" {
  description = "CPU percentage threshold to scale out"
  default = 80
}

variable "scale_out_adjustment" {
  description = "Number of tasks to be incremented during scale out"
  default = 1
}

variable "scale_out_comparison_operator" {
  description = "Scale out strategy"
  default = "GreaterThanOrEqualThreshold"
}

variable "scale_out_statistic" {
  description = "Scale out metric statistic"
  default = "Average"
}

variable "scale_out_period" {
  description = "Start of scale out after reaching the threshold"
  default = 60
}

variable "scale_out_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  default = 2
}

variable "scale_out_cooldown" {
  description = "Amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start"
  default = 60
}

variable "scale_in_cpu_threshold" {
  description = "CPU percentage threshold to scale in"
  default = 30
}

variable "scale_in_adjustment" {
  description = "Number of tasks to be decremented during scale in"
  default = -1
}

variable "scale_in_comparison_operator" {
  description = "Scale in strategy"
  default = "LessThanOrEqualToThreshold"
}

variable "scale_in_statistic" {
  description = "Scale in metric statistic"
  default = "Average"
}

variable "scale_in_period" {
  description = "Start of scale in after reaching the threshold"
  default = 120
}

variable "scale_in_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  default = 3
}

variable "scale_in_cooldown" {
  description = "Amount of time, in seconds, after a scaling in activity completes and before the next scaling in activity can start"
  default = 120
}

### Tracking CPU
variable "scale_tracking_cpu" {
  description = "CPU percentage threshold to scale out when using cpu_tracking scale type"
  default = 8
}

### Tracking Requests
variable "alb_arn" {
  description = "Application load balancer ARN"
  default = null
}

variable "scale_tracking_requests" {
  description = "Number of requests, per second, desired per task"
  default = 0
}