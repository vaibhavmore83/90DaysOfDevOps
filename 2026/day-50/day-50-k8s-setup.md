# Kubernetes Architecture and Cluster Setup  

**Kubernetes History**  

Kubernetes was originated by Google as Borg as Open Source Container Orchestration tool donated to CNCF.  

---  

**Kind Setup**  

Choose kind over minikube for its faster startup times, lower resource usage, and the ability to easily create multi-node clusters.  

```bash
$ cat kind-config.yml

kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: tws-cluster

nodes:

- role: control-plane
  image: kindest/node:v1.35.0
- role: worker
  image: kindest/node:v1.35.0
- role: worker
  image: kindest/node:v1.35.0
```
```bash
$ kubectl get nodes

NAME                        STATUS   ROLES           AGE     VERSION
tws-cluster-control-plane   Ready    control-plane   8m44s   v1.35.0
```
```bash
$ kubectl get pods -n kube-system

NAME                                                READY   STATUS    RESTARTS      AGE
coredns-7d764666f9-4sbqd                            1/1     Running   0             17m
coredns-7d764666f9-gvsbv                            1/1     Running   0             17m
etcd-tws-cluster-control-plane                      1/1     Running   0             18m
kindnet-8w729                                       1/1     Running   0             17m
kube-apiserver-tws-cluster-control-plane            1/1     Running   0             18m
kube-controller-manager-tws-cluster-control-plane   1/1     Running   1 (16m ago)   18m
kube-proxy-x9g66                                    1/1     Running   0             17m
kube-scheduler-tws-cluster-control-plane            1/1     Running   1 (15m ago)   18m
```

**CoreDNS** - CoreDNS is the default DNS server for Kubernetes clusters, providing service discovery and domain resolution for pods and services, running as a coredns deployment in the kube-system namespace.  
**etcd** - etcd is a strongly consistent, distributed key-value store that acts as the single source of truth for a Kubernetes cluster.  
**kindnet** - Kindnet is the default, lightweight CNI (Container Network Interface).  
**kube-apiserver** - It acts as the central communication hub and frontend to the cluster's shared state.  
**kube-controller-manager** - Ensuring the cluster's actual state matches the desired state. It manages core loops like node, replication, and service account controllers, configured via kubeadm settings in the kind YAML.  
**kube-proxy** - It configures networking rules to route traffic to the correct backend pods.  
**kube-scheduler** - It is responsible for assigning newly created Pods to appropriate Nodes within a cluster. It watches for Pods that have no Node assigned and identifies the best Node for them to run on, a process known as scheduling.  
