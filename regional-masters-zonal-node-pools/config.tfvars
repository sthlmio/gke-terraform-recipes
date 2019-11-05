region = "europe-north1"
zone = "europe-north1-a"
master_version = "1.14.7-gke.14"
enable_istio = true

system_pool_machine_type = "n1-standard-1"
system_pool_node_count = 2
system_pool_disk_size = 50
system_pool_disk_type = "pd-ssd"

worker_pool_machine_type = "n1-standard-1"
worker_pool_node_count = 2
worker_pool_node_count_burstable = 5
worker_pool_disk_size = 50
worker_pool_disk_type = "pd-ssd"