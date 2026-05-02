FROM gliderlabs/alpine:3.3@sha256:02543032e5431a50bb4c519c4974359c529d3473f844b26c297b890912f02093 # 3.3
RUN apk --no-cache add nginx
EXPOSE 3000 80 443 22
CMD ["nginx", "-g", "daemon off;"]
