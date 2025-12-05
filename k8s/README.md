# Setup ArgoCD

## Prerequisites

- Have a green field Kubernetes installed

## Deploy ArgoCD

Run 
```
kubectl apply -k k8s/argocd
```
(twice)

It will:
1. create the `argocd` namespace
2. deploy ArgoCD into said namespace
3. add this repository as an ArgoCD repository and create a `homeserver` AppProject (this is reason the commands needs to be run twice, since the CRDs only get created in the first run)

## Deploy the ArgoCD ApplicationSet for your server

Run 
```
kubectl apply -f k8s/appsets/<server>-appset.yaml
```
replacing `<server>` with the targeted environment.

It will deploy every application in `k8s/apps/<application>/envs/<server>` on the server. This follows the recommendations from this [blog post](https://codefresh.io/blog/how-to-structure-your-argo-cd-repositories-using-application-sets/).