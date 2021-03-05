minikube start

# METALB
IP=$(minikube ip)

sed "s/MINIKUBEIP/$IP/g" srcs/metalb/template_metalb.yaml > srcs/metalb/metallb.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metalb/metallb.yaml

# NGINX
eval $(minikube docker-env) 
docker build -t my-nginx srcs/nginx/.
kubectl apply -f srcs/nginx/config.yaml


minikube dashboard
