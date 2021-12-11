ci_build_image:

	docker build --build-arg COIN="FRA" -t $(PUBLIC_ECR_URL)/$(ENV)/blockscout:$(IMAGE_TAG) -f ./docker/Dockerfile
ifeq ($(ENV),release)
	docker tag $(PUBLIC_ECR_URL)/$(ENV)/blockscout:$(IMAGE_TAG) $(PUBLIC_ECR_URL)/$(ENV)/findorad:latest
endif

ci_push_image:
	docker push $(PUBLIC_ECR_URL)/$(ENV)/blockscout:$(IMAGE_TAG)
ifeq ($(ENV),release)
	docker push $(PUBLIC_ECR_URL)/$(ENV)/blockscout:latest
endif

clean_image:
	docker rmi $(PUBLIC_ECR_URL)/$(ENV)/blockscout:$(IMAGE_TAG)
ifeq ($(ENV),release)
	docker rmi $(PUBLIC_ECR_URL)/$(ENV)/blockscout:latest
endif