FROM node:carbon@sha256:a681bf74805b80d03eb21a6c0ef168a976108a287a74167ab593fc953aac34df # carbon
COPY package.json yarn.lock my_app/
