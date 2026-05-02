FROM node:12@sha256:01627afeb110b3054ba4a1405541ca095c8bfca1cb6f2be9479c767a2711879e # 12
RUN npm install sax
RUN npm install sax --no-cache
RUN npm install sax | grep fail && npm install sax@latest
RUN npm install sax@latest | grep fail && npm install sax
RUN npm install sax | grep fail && npm install sax
RUN npm i -g @angular/cli
RUN ["npm","add","sax"]
