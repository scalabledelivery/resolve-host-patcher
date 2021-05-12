# resolve-host-patcher
This addresses the problem of nfs and glusterfs hostnames not working in kubernetes configurations when you apply.

Install is simple:
```
# kubectl apply -f https://raw.githubusercontent.com/scalabledelivery/resolve-host-patcher/main/daemonset.yaml
```

The daemonset runs when deployed and on start whenever a node is rebooted.
