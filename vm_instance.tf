
resource "google_compute_instance" "vm_manager" {
  name         = "vm-manager"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["job", "manager"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnetwork.name
  }

  metadata = {
    job = "manager"
  }

  metadata_startup_script = file("./script.tpl")

  service_account {
    email  = google_service_account.gke-manager.email
    scopes = ["cloud-platform"]
  }
}