# Regional masters and regional node pools

This will create a regional cluster with 3 master nodes and 1 regional node pool with 3 nodes spread across 3 zones (HA).

### Init
```
terraform init
```

### Setup new cluster (prompted)
```
terraform apply
```

### Setup new cluster (pre-defined)
```
terraform apply -var-file=config.tfvars
```

### Destroy cluster
```
terraform destroy -var-file=config.tfvars
```