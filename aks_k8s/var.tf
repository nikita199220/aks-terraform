variable resource_group_name {
    default = "azure-k8stest"
}
variable location {
    default = "EAST US 2"
}
variable cluster_name {
    default = "k8stest"
}
variable "dns_prefix" {
    default = "k8stest"
}
variable "agent_count" {
    default = 3
}