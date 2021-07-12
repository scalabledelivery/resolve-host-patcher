# resolve-host-patcher
This addresses the problem of nfs and glusterfs hostnames not working in kubernetes configurations when you apply.

Install is simple:
```
# kubectl apply -f https://raw.githubusercontent.com/scalabledelivery/resolve-host-patcher/main/daemonset.yaml
# kubectl -n kube-system rollout status daemonset/resolve-host-patcher --watch --timeout=10m
```

The daemonset runs when deployed and on start whenever a node is rebooted.

# Much Ado About Managed Control Planes
If you have a managed Kubernetes on `Digital Ocean` or `Linode`, it is unfortunate that they failed to configure the control plane to resolve cluster DNS. This daemonset can not fix those issues.
