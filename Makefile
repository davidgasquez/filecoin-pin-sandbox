.PHONY: generate-keys
generate-keys:
	pdptool create-service-secret | tail -n 5 > pdp-public-key

ping:
	pdptool ping --service-url $(SERVICE_URL) --service-name $(SERVICE_NAME)
