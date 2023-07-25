variable "name" {
  type        = string
  description = "The name of the Firestore collection."
}

variable "single_field_index_exemptions" {
  type        = set(string)
  description = "A set of field names that should not be indexed."
  default     = []
}
