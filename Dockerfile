FROM ubuntu:noble-20240801@sha256:8a37d68f4f73ebf3d4efafbcf66379bf3728902a8038616808f04e34a9ab63ee
RUN apt-get update -qq \
           && apt-get install -y -q --no-install-recommends \
                  ca-certificates curl apt-utils unzip \
           && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://deno.land/install.sh | sh && \
    export DENO_INSTALL="/root/.deno" && \
    export PATH="$DENO_INSTALL/bin:$PATH" && \
    deno install -Agf -n bids-validator jsr:@bids/validator@1.15.0
