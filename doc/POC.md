# Встановлення ArgoCD на k3d

Створити новий кластер
```
k3d create cluster argocd
```
Перевірити поточний контекст
```
kubectl config current-context
```
За потреби змінити поточний контекст
```
kubectl config use-context k3d-argocd
```
Створити namespace
```
kubectl create namespace argocd
```
Встановити ArgoCD
```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
Створити portforwarding
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
Зайти на https://localhost:8080/applications у браузері

Отримати secret 
```
k -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

```
Виконати авторизацію (логін - admin , пароль - отриманий secret)

## Демо
![Alt Text](/doc/img/poc-demo.gif)