eval $(minikube docker-env)
minikube stop
minikube delete
minikube start

IP_MINIKUBE=$(minikube ip)

sed "s/MINIKUBEIP/$IP_MINIKUBE/g" srcs/metallb/template_metallb.yaml > srcs/metallb/metallb.yaml
sed "s/MINIKUBEIP/$IP_MINIKUBE/g" srcs/ftps/srcs/script_template.sh > srcs/ftps/srcs/script.sh
eval $(minikube docker-env)

# Setup MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb/metallb.yaml

# Setup Nginx
docker build -t my-nginx ./srcs/nginx/
kubectl apply -f ./srcs/nginx/config.yaml

# Setup FTPs
eval $(minikube docker-env)
docker build -t my-ftps ./srcs/ftps/
kubectl apply -f ./srcs/ftps/config.yaml

# Start minikube
minikube dashboard
