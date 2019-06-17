region                        = "europe-north1"
master_version                = "1.13.6-gke.6"
worker_machine_type           = "n1-standard-1"
worker_node_count             = 1 # Will be multiplied by 3 zones
worker_node_count_burstable   = 3 # Will be multiplied by 3 zones
worker_disk_size              = 50
worker_disk_type              = "pd-ssd"
cluster_name                  = "test"