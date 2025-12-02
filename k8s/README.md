# Setup ArgoCd

## Prerequisites

- Have a green field Kubernetes installed

## Deploy ArgoCd

Run 
```
kubectl apply -k k8s/argocd
```

It will:
1. create the `argocd` namespace
2. deploy argocd into said namespace
3. add the configuration for the homeserver repository and a homeserver AppProject