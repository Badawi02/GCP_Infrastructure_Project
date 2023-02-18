resource "google_compute_network" "vpc_network" {
    name = "terraform-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
    name = "management-subnet"
    ip_cidr_range = "10.2.0.0/16"
    region = "us-central1"
    network = google_compute_network.vpc_network.name
}
resource "google_compute_subnetwork" "subnetwork_2" {
    name = "restricted-subnet"
    ip_cidr_range = "10.1.0.0/16"
    region = "us-central1"
    network = google_compute_network.vpc_network.name
}


resource "google_compute_firewall" "ssh" {
  name = "allow-ssh-vm"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["manager"]
  source_ranges = ["0.0.0.0/0"]
}