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

## Create sealed secrets (for e.g. Porkbun API access)

Switch into the directory for secret creation

```
cd k8s/apps/kustomize/sealed-secrets/envs/<server>
```

Create an *.env file containig key-value pairs you want to be sealed. **Do not commit this file!**

```
cat << EOF > porkbun-api-access.env
PORKBUN_API_KEY="pk1_..."
PORKBUN_SECRET_API_KEY="sk1_..."
EOF
```

Create an unsealed secret in the correct namespace. **Do not commit this file either!**

```
kubectl -n <namespace> create secret generic porkbun-api-access --dry-run=client --from-env-file=porkbun-api-access.env -o yaml > porkbun-api-access-unsealed.yaml
```

Seal the secret. Make sure you are in the correct k8s cluster context!

```
kubeseal -f porkbun-api-access-unsealed.yaml -w porkbun-api-access-sealed.yaml
```

Commit the `-sealed.yaml` file. Profit.