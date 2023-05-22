.PHONY: Dockerfile

Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
			--base-image ubuntu:jammy-20221130 \
			--pkg-manager apt \
			--install "ca-certificates curl apt-utils" \
			--run "curl -sL https://deb.nodesource.com/setup_18.x | bash -" \
			--install "nodejs" \
			--run "node --version && npm --version && npm install -g bids-validator@1.11.0" \
		> Dockerfile
