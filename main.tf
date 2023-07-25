# This defines fields with an empty `index_config` block which disables indexing on them.
resource "google_firestore_field" "index_exempted" {
  for_each = var.single_field_index_exemptions

  collection = var.name
  field      = each.key

  index_config {}
}
