variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID in which the collections are configured."
  default     = null
}

variable "database" {
  type        = string
  description = "The name of the Firestore database. Defaults to the `(default)` database."
  default     = "(default)"
}

variable "name" {
  type        = string
  description = "The name of the Firestore collection."
}

variable "single_field_index_exemptions" {
  type        = set(string)
  description = "A set of field names that should not be indexed."
  default     = []
}

variable "expire_soft_deleted_documents" {
  type        = bool
  description = "Whether to set a TTL on the soft-deleted collection to automatically garbage collect documents in it. Defaults to `true`."
  default     = true
}
