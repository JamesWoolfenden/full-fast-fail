FROM node:12@sha256:01627afeb110b3054ba4a1405541ca095c8bfca1cb6f2be9479c767a2711879e # 12
RUN npm install
RUN npm install sax@latest
RUN npm install sax@0.1.1
RUN npm install sax@0.1.1 | grep fail && npm install sax@latest
RUN npm install git://github.com/npm/cli.git
RUN npm install git+ssh://git@github.com:npm/cli#semver:^5.0
RUN npm install --production --no-cache
