# Terraform module for Firestore collections

This module is a helper to define Firestore collections using Terraform. While a Firestore collection doesn't need to be created (it exists as soon as a document is added to it), some aspects of it can be managed by Terraform, like indexes and TTLs.

This module provides features that integrate with [Causa](https://github.com/causa-io) concepts, like the soft-deleted document collection.

## ➕ Requirements

This module depends on the [google Terraform provider](https://registry.terraform.io/providers/hashicorp/google/latest).

## 🎉 Installation

Copy the following in your Terraform configuration, and run `terraform init`:

```terraform
module "my_collection" {
  source  = "causa-io/firestore-collection/google"
  version = "<insert the most recent version number here>"

  # The name of the Firestore collection.
  name = "myCollection"
}
```

## ✨ Features

### Single field index exemptions

It is [recommended](https://firebase.google.com/docs/firestore/query-data/index-overview#indexing_best_practices) that fields containing sequential values should not be indexed. This is usually the case for "lifecycle" timestamp fields, such as `createdAt` and `updatedAt`. If you don't need to query on those fields, you can disable indexing on them by adding them to the `single_field_index_exemptions` list:

```terraform
module "my_collection" {
  source  = "causa-io/firestore-collection/google"
  version = "<insert the most recent version number here>"

  name = "myCollection"

  # These fields will not be indexed.
  single_field_index_exemptions = ["createdAt", "updatedAt", "deletedAt"]
}
```

### Soft-deleted documents TTL

The Causa runtime (for example the [TypeScript Google runtime](https://github.com/causa-io/runtime-typescript-google) with the `FirestoreStateTransaction`) can move documents with a non-null `deletedAt` field to a separate "soft-deleted" collection (suffixed with `$deleted`), such that the documents can no longer be queried by clients. Those documents are kept in the "soft-deleted" collection also to account for unordered event processing.

The Causa runtime sets an additional field in the soft-deleted documents, `_expirationDate`, which can be used by the TTL policy. This Terraform module automatically sets the TTL policy, and disables indexing on the `_expirationDate` field.

If you don't need this feature on a collection (i.e. it does not have a "soft-deleted" counterpart), the TTL (and index exemption) can be disabled using the `expire_soft_deleted_documents` variable:

```terraform
module "my_collection" {
  source  = "causa-io/firestore-collection/google"
  version = "<insert the most recent version number here>"

  name = "myCollection"
  # When explicitly set to `false`, the module will not set the TTL on the `myCollection$deleted._expirationDate` field.
  # It will not disable indexing on it either.
  expire_soft_deleted_documents = false
}
```
