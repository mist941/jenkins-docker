output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "jenkins_url" {
  description = "URL to access Jenkins"
  value       = "http://${module.application.alb_dns_name}"
}

output "jenkins_alb_dns_name" {
  description = "DNS name of the Jenkins Application Load Balancer"
  value       = module.application.alb_dns_name
}

output "efs_file_system_id" {
  description = "ID of the EFS file system"
  value       = module.storage.efs_file_system_id
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = module.compute.ecs_cluster_name
}