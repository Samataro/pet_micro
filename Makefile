minikube_start:
	minikube start \
		--mount \
		--mount-string='/Volumes/Data/MiniKubeData:/mnt/data' \
		--ports=443:443,80:80