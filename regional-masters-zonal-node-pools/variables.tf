variable "project" {
  description = "Project ID on Google Cloud"
}

variable "cluster_name" {
  description = "Cluster name"
}

variable "region" {
  description = "Region on Google Cloud (e.g. europe-north1)"
}

variable "zone" {
  description = "Zone in defined region (e.g. europe-north1-a)"
}

variable "master_version" {
  description = "Master version (e.g 1.13.6-gke.6)"
}

variable "system_pool_node_count" {
  description = "Number of system pool nodes (per zone, since it's regional)"
}

variable "system_pool_machine_type" {
  description = "Machine type on system pool nodes (e.g. n1-standard-1)"
}

variable "system_pool_disk_size" {
  description = "Disk size in GB for each system pool node"
}

variable "system_pool_disk_type" {
  description = "Disk type (e.g pd-sdd or pd-standard)"
}

variable "worker_pool_node_count" {
  description = "Number of worker pool nodes (per zone, since it's regional)"
}

variable "worker_pool_node_count_burstable" {
  description = "Number of worker pool nodes we can burst to (per zone, since it's regional)"
}

variable "worker_pool_machine_type" {
  description = "Machine type on worker pool nodes (e.g. n1-standard-1)"
}

variable "worker_pool_disk_size" {
  description = "Disk size in GB for each worker node"
}

variable "worker_pool_disk_type" {
  description = "Disk type (e.g pd-sdd or pd-standard)"
}