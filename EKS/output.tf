output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "kubeconfig" {
  description = "Kubeconfig content for connecting to the EKS cluster"
  value       = module.eks.kubeconfig
  sensitive   = true
}
