# 🔖 Changelog

## Unreleased

## v0.3.1 (2024-08-30)

Chores:

- Upgrade compatible `google` provider versions to support `6.*.*`.

## v0.3.0 (2024-04-09)

Features:

- Expose the `database` variable. It defaults to `(default)`.

## v0.2.1 (2024-02-21)

Chores:

- Upgrade compatible `google` provider versions to support `5.*.*`.

## v0.2.0 (2023-07-28)

Features:

- Expose the `gcp_project_id` variable.

## v0.1.0 (2023-07-26)

Features:

- Implement the `single_field_index_exemptions` to easily remove indexes from single fields in a collection.
- Implement the `expire_soft_deleted_documents` to define the TTL policy on the related "soft-deleted documents" collection.
