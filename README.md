# gke-terraform-recipes
A curated list of Google Kubernetes Engine Terraform Recipes

## Requirements
- [terraform `^0.12.0`](https://www.terraform.io/)

## OAuth scopes used for all node pools
https://developers.google.com/identity/protocols/googlescopes
```
oauth_scopes = [
  "compute-rw",
  "storage-ro",
  "logging-write",
  "monitoring",
  "https://www.googleapis.com/auth/service.management",
  "https://www.googleapis.com/auth/sqlservice.admin"
]
```