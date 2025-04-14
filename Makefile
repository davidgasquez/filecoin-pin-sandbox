.PHONY: setup-pdptool
setup-pdptool:
	rm -rf /tmp/curio || true
	git clone https://github.com/filecoin-project/curio.git /tmp/curio
	cd /tmp/curio && git checkout feat/pdp && cd cmd/pdptool && go build .
	mkdir -p .local/bin
	sudo cp /tmp/curio/cmd/pdptool/pdptool /usr/local/bin/
	rm -rf /tmp/curio
