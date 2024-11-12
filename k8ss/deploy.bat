minikube start

kubectl apply -f deployment-vatrinah.yaml

kubectl apply -f deployment-mvc.yaml

kubectl apply -f deployment-taskapp.yaml

kubectl apply -f deployment-k8s-webserver.yaml


minikube status
kubectl get all -o wide
minikube dashboard

pause