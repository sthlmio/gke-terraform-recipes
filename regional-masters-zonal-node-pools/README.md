# Regional masters and zonal node pools

This will create a regional cluster with 3 master nodes (HA) and 2 different node pools with 2 nodes in one zone.
Good for a HA setup with masters and possibilities to spread workloads on different node pools with different machine types etc. The system node pool will be tainted with `SystemAddonsOnly=true` so you can define a toleration on pods that should be able to run in that node pool. All other pods will try to schedule on the worker node pool.

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