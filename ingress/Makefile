release:
		@echo "Applying terraform..."; \
		if [ -f local.tfvars ]; then \
			terraform apply -auto-approve --var-file=local.tfvars; \
		else \
			if [ -f ../local.tfvars ]; then \
				terraform apply -auto-approve --var-file=../local.tfvars; \
				else terraform apply -auto-approve; \
			fi \
		fi
