resource "google_compute_address" "default" {
  name = "${var.cluster_name}"
}

resource "google_container_cluster" "cluster" {
  provider                  = "google"
  name                      = "${var.cluster_name}"
  project                   = "${var.project}"
  location                  = "${var.region}"
  min_master_version        = "${var.master_version}"
  initial_node_count        = "${var.worker_node_count}"
  remove_default_node_pool  = true

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
}

resource "google_container_node_pool" "node_pool" {
  provider            = "google"
  project             = "${var.project}"
  cluster             = "${google_container_cluster.cluster.name}"
  location            = "${var.region}"
  initial_node_count  = "${var.worker_node_count}"
  version             = "${var.master_version}"

  node_config {
    machine_type  = "${var.worker_machine_type}"
    disk_size_gb  = "${var.worker_disk_size}"
    disk_type     = "${var.worker_disk_type}"

    # https://developers.google.com/identity/protocols/googlescopes
    oauth_scopes = [
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring",
      "https://www.googleapis.com/auth/service.management",
      "https://www.googleapis.com/auth/sqlservice.admin"
    ]
  }

  management {
    auto_repair   = true
    auto_upgrade  = true
  }

  autoscaling {
    min_node_count  = "${var.worker_node_count}"
    max_node_count  = "${var.worker_node_count_burstable}"
  }
}