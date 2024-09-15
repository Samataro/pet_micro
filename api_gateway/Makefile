release:
	@VER=$$(sed -n 's/pet-go-microservices-api-gateway:\([\d\.]*\)/\1/p' deployment.tf | awk '{print $$3}' | tr -d '"') && \
		INCREMENTED=$$(echo $$VER | awk -F. '{$$NF = $$NF + 1;} 1' OFS=.) && \
		echo "Building image..." && \
		docker build -q -t pet-go-microservices-api-gateway:$$INCREMENTED . && \
		echo "Uploading image to k8s..." && \
		minikube image load pet-go-microservices-api-gateway:$$INCREMENTED && \
		sed -i '' -e "s/pet-go-microservices-api-gateway:$$VER/pet-go-microservices-api-gateway:$$INCREMENTED/g" deployment.tf && \
		echo "Applying terraform..." && \
		if [ -f local.tfvars ]; then \
			terraform apply -auto-approve --var-file=local.tfvars; \
		else \
			if [ -f ../local.tfvars ]; then \
				terraform apply -auto-approve --var-file=../local.tfvars; \
				else terraform apply -auto-approve; \
			fi \
		fi
