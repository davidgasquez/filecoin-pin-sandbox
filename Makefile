.PHONY: generate-keys
generate-keys:
	pdptool create-service-secret | tail -n 5 > pdp-public-key

ping:
	pdptool ping --service-url https://yablu.net --service-name pdp-tippy
