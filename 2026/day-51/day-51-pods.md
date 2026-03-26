# Kubernetes Manifests and Your First Pods  

**nginx-pod.yaml**
```bash
kind: Pod
apiVersion: v1
metadata:
    name: nginx-pod
spec:
    containers:
    - name: nginx
      image: nginx:latest
      ports:
      - containerPort: 80
```
---  

**Validate Before Applying**  

The command with --dry-run=client doesnt give any error even though image field was missing in pod.yaml file; but --dry-run=server gave below error message.  

$ kubectl apply -f pod.yml --dry-run=server  
The Pod "nginx-pod" is invalid: spec.containers[0].image: Required value  
