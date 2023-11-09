.PHONY: Dockerfile

Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
			--base-image ubuntu:jammy-20221130 \
			--pkg-manager apt \
			--install "ca-certificates curl apt-utils gnupg" \
			--run "mkdir -p /etc/apt/keyrings" \
			--run "curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg" \
			--env NODE_MAJOR=18 \
			--run 'echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list' \
			--run "curl -sL https://deb.nodesource.com/setup_18.x | bash -" \
			--install "nodejs" \
			--run "node --version && npm --version && npm install -g bids-validator@1.13.1" \
		> Dockerfile
