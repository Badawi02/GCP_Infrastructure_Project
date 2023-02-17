
resource "google_service_account" "sa-name" {
  account_id = "sa-name"
  display_name = "SA"
}

resource "google_project_iam_member" "firestore_owner_binding" {
  project = "my-project-56889-badawi"
  role    = "roles/datastore.owner"
  member  = "serviceAccount:${google_service_account.sa-name.email}"
}