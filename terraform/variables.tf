variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "jenkins"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type for ECS cluster"
  type        = string
  default     = "t3.small"
}

variable "cluster_min_size" {
  description = "Minimum number of EC2 instances in ECS cluster"
  type        = number
  default     = 1
}

variable "cluster_max_size" {
  description = "Maximum number of EC2 instances in ECS cluster"
  type        = number
  default     = 3
}

variable "cluster_desired_capacity" {
  description = "Desired number of EC2 instances in ECS cluster"
  type        = number
  default     = 1
}

variable "jenkins_cpu" {
  description = "CPU units for Jenkins container (1024 = 1 vCPU)"
  type        = number
  default     = 1024
}

variable "jenkins_memory" {
  description = "Memory for Jenkins container (in MB)"
  type        = number
  default     = 2048
}