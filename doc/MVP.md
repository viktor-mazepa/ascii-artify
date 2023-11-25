## Автоматичне розгортання і синхронізація додатку з GitHub у ArgoCD

Перевірити поточний контекст
```
kubectl config current-context
```
За потреби змінити поточний контекст
```
kubectl config use-context k3d-argocd
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

Натиснути `New App`

Ввести ім'я додатку (в моєму кейсі week4-demo)

Обрати проект (за замолчуванням це default)

Ввести URL репозиторію у поле `Repository URL`

У полі Path обрати шлях до каталогу Helm

Обрати Cluster URL (простір імен кластеру Kubernetes)

Ввести ім'я namespce у відповідному полі

У розділі `Cync Options` обрати `Autocreate Namespace`

Нажати `Create`

Відкрити доданий додаток

Нажати `Sync`

## Демо роботи розгорнутого у Argo CD додатку
![Alt Text](/doc/img/mvp_demo.gif)
