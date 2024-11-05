.PHONY: docker-compose-up
docker-compose-up: 
#   rm -rf data/postgres
	docker-compose -f docker-compose.yml up -d

.PHONY: encrypt-pwd
encrypt-pwd:
	@echo "1qaz2wsx" | openssl base64
