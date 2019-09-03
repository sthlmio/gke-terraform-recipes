resource "google_container_cluster" "cluster" {
  provider                  = "google-beta"
  name                      = var.cluster_name
  project                   = var.project
  location                  = var.region
  min_master_version        = var.master_version
  initial_node_count        = 1
  remove_default_node_pool  = true

  node_locations = [
    var.zone,
  ]

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }

  ip_allocation_policy {
    create_subnetwork = true
  }

  master_auth {
    username = ""
    password = ""
  }

  lifecycle {
    ignore_changes  = [
      "network",
      "node_pool"
    ]
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "01:00"
    }
  }

  addons_config {
    istio_config {
      disabled = var.enable_istio ? false : true
      auth = "AUTH_MUTUAL_TLS"
    }
  }
}

resource "google_container_node_pool" "system_pool" {
  provider            = "google"
  project             = var.project
  cluster             = google_container_cluster.cluster.name
  location            = var.region
  initial_node_count  = var.system_pool_node_count
  version             = var.master_version

  node_config {
    machine_type  = var.system_pool_machine_type
    disk_size_gb  = var.system_pool_disk_size
    disk_type     = var.system_pool_disk_type

    # https://developers.google.com/identity/protocols/googlescopes
    oauth_scopes = [
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring",
      "https://www.googleapis.com/auth/service.management"
    ]

    taint {
      key = "SystemAddonsOnly"
      value = "true"
      effect = "PREFER_NO_SCHEDULE"
    }
  }

  management {
    auto_repair   = true
    auto_upgrade  = true
  }
}

resource "google_container_node_pool" "worker_pool" {
  provider            = "google"
  project             = var.project
  cluster             = google_container_cluster.cluster.name
  location            = var.region
  initial_node_count  = var.worker_pool_node_count
  version             = var.master_version

  node_config {
    machine_type  = var.worker_pool_machine_type
    disk_size_gb  = var.worker_pool_disk_size
    disk_type     = var.worker_pool_disk_type

    # https://developers.google.com/identity/protocols/googlescopes
    oauth_scopes = [
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring",
      "https://www.googleapis.com/auth/service.management"
    ]
  }

  management {
    auto_repair   = true
    auto_upgrade  = true
  }

  autoscaling {
    min_node_count  = var.worker_pool_node_count
    max_node_count  = var.worker_pool_node_count_burstable
  }
}