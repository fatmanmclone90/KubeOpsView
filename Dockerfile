FROM hjacobs/kube-ops-view

RUN apt-get update && apt-get install --yes curl unzip

RUN curl -LJO https://github.com/Azure/kubelogin/releases/download/v0.0.29/kubelogin-linux-amd64.zip && \
  unzip ./kubelogin-linux-amd64.zip && \
  mv ./bin/linux_amd64/kubelogin /usr/bin

ENTRYPOINT ["python3", "-m", "kube_ops_view"]