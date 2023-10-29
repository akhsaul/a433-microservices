# a433-microservices
Repository ini digunakan untuk kebutuhan kelas Belajar Membangun Arsitektur Microservices
<br><br>

## Install helm
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
<br>

## Prometheus in minikube
1. Add repository to helm <br> `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
2. Install prometheus in monitoring namespace <br> `helm install prometheus prometheus-community/prometheus --namespace monitoring`\
3. Expose prometheus service <br> `kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-np -n monitoring`
4. Access prometheus by url <br> `minikube service prometheus-server-np --url -n monitoring`
<br><br>

## Grafana in minikube
1. Add repository to helm <br> `helm repo add grafana https://grafana.github.io/helm-charts`
2. Install grafana in monitoring namespace <br> `helm install grafana grafana/grafana --namespace monitoring`
3. Expose grafana service <br> `kubectl expose service grafana --type=NodePort --target-port=3000 --name=grafana-np -n monitoring`
4. Get password for access grafana with username **admin** <br> `kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`
5. Access grafana by url <br> `minikube service grafana-np --url -n monitoring`
