# Kubectl Proxy

See [here](https://codeberg.org/hjacobs/kube-ops-view) for Kube Ops View.

KubeOps view connects to the cluster using the `kubectl proxy`.

Connect to the desired "context".

```
kubectl config get-contexts

kubectl config set-context foo
```

Start the proxy

```
kubectl proxy --accept-hosts '.*'
```

Leave proxy running.  Navigate to `http://localhost:8001/apis` to check proxy is active.

Build the docker image

```
docker build . -t kuop
```

Start the container (Windows)

```
docker run -it --rm -p 8080:8080 -e CLUSTERS=http://host.docker.internal:8001 kuop
```

Navigate to to KubeOps View

```
http://localhost:8000
```