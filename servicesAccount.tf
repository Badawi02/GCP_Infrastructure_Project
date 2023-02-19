
# service account for gke manager
resource "google_service_account" "gke-manager" {
  account_id = "gke-manager"
  display_name = "gke-manager"
}
resource "google_project_iam_member" "admin_binding" {
  project = "my-project-56889-badawi"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.gke-manager.email}"
}

# service account node gke
resource "google_service_account" "node-gke" {
  account_id = "node-gke"
  display_name = "node-gke"
}
resource "google_project_iam_member" "node-binding" {
  project = "my-project-56889-badawi"
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.node-gke.email}"
}
