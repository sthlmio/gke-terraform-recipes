# Regional masters and zonal node pools

This will create a regional cluster with 3 master nodes (HA) and 2 different node pools, one worker pool with 0-3 nodes and one preemptible (spot instance) pool with 3-6 nodes.
Good for a HA setup with masters and possibilities to spread workloads. The worker pool can take critical workload and the preemptible pool can take cronjobs, burstable and stateless workloads. The preemptible node pool will be tainted with `PreemptibleWorkloadOnly=true` so you can define a toleration on pods that should be able to run in that node pool. All other pods will schedule on the worker node pool. That means all important pods in `kube-system` like dns etc will run on the worker node pool.

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