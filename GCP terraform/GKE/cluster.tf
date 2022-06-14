resource "google_project_service" "project" {
  project = var.google_project
  service = "container.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_compute_subnetwork" "custom" {
  name          = "test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.custom.id
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "192.168.1.0/24"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.64.0/22"
  }
}

resource "google_compute_network" "custom" {
  name                    = "test-network"
  auto_create_subnetworks = false
}

resource "google_container_cluster" "my_vpc_native_cluster" {
  name               = "my-vpc-native-cluster"
  location           = "us-central1"
  initial_node_count = 1

  network    = google_compute_network.custom.id
  subnetwork = google_compute_subnetwork.custom.id

  /*ip_allocation_policy {
    cluster_secondary_range_name  = google_compute_subnetwork.custom.secondary_ip_range.0.range_name
    services_secondary_range_name = google_compute_subnetwork.custom.secondary_ip_range.1.range_name
  }*/

  # other settings...
}