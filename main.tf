# This defines fields with an empty `index_config` block which disables indexing on them.
resource "google_firestore_field" "index_exempted" {
  for_each = var.single_field_index_exemptions

  project    = var.gcp_project_id
  database   = var.database
  collection = var.name
  field      = each.key

  index_config {}
}

# The collection suffixed with `$deleted` is used to store soft-deleted documents, which should be deleted when
# `_expirationDate` is reached.
resource "google_firestore_field" "deleted_ttl" {
  count = var.expire_soft_deleted_documents ? 1 : 0

  project    = var.gcp_project_id
  database   = var.database
  collection = "${var.name}$deleted"
  field      = "_expirationDate"

  index_config {}
  ttl_config {}
}
