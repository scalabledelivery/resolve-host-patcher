# resolve-host-patcher
This addresses the problem of nfs and glusterfs hostnames not working in Kubernetes configurations when you apply.

There are two versions of this.

Using `daemonset.yaml` will just purge `resolv.conf` and reconfigure the nodes to use coredns in the cluster for DNS resolution.

Using `daemonset-merge.yaml` will make an attempt to do a friendly merge of coredns in `resolv.conf` with higher priority.

Install is simple:
```
# kubectl apply -f https://raw.githubusercontent.com/scalabledelivery/resolve-host-patcher/main/daemonset.yaml
# kubectl -n kube-system rollout status daemonset/resolve-host-patcher --watch --timeout=10m
```

The daemonset runs when deployed and whenever a node is rebooted. It also does a patch periodically.

# Much Ado About Managed Control Planes
If you have a managed Kubernetes on `Digital Ocean` or `Linode`, it is unfortunate that they failed to configure the control plane to resolve cluster DNS. This daemonset can not fix those issues.
