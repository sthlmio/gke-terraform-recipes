region = "europe-north1"
zone = "europe-north1-a"
master_version = "1.13.7-gke.24"
cluster_name = "production"

worker_pool_machine_type = "n1-standard-1"
worker_pool_node_count = 0
worker_pool_node_count_burstable = 3
worker_pool_disk_size = 50
worker_pool_disk_type = "pd-ssd"

preemptible_pool_machine_type = "n1-standard-1"
preemptible_pool_node_count = 3
preemptible_pool_node_count_burstable = 6
preemptible_pool_disk_size = 50
preemptible_pool_disk_type = "pd-ssd"