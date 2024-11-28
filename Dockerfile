FROM denoland/deno:alpine-2.1.1
RUN deno install -Agf -n bids-validator jsr:@bids/validator@1.15.0
