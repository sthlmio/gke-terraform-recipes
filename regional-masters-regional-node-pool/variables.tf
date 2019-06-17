variable "project" {
  description = "Project ID on Google Cloud"
}

variable "cluster_name" {
  description = "Cluster name"
}

variable "region" {
  description = "Region on Google Cloud (e.g. europe-north1)"
}

variable "worker_node_count" {
  description = "Number of worker nodes (per zone, since it's regional)"
}

variable "worker_node_count_burstable" {
  description = "Number of worker nodes we can burst to (per zone, since it's regional)"
}

variable "worker_machine_type" {
  description = "Machine type on worker nodes (e.g. n1-standard-1)"
}

variable "worker_disk_size" {
  description = "Disk size in GB for each worker node"
}

variable "worker_disk_type" {
  description = "Disk type (e.g pd-sdd or pd-standard)"
}

variable "master_version" {
  description = "Master version (e.g 1.13.6-gke.6)"
}