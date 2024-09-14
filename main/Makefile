minikube_start:
	minikube start \
		--mount \
		--mount-string='/Volumes/Data/MiniKubeData:/mnt/data' \
		--ports=443:443,80:80

terraform_apply_local:
	terraform apply --var-file=local.tfvars