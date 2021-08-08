FROM alpine:latest
RUN apk add --no-cache npm
WORKDIR /app
COPY . /app
RUN npm install -y
EXPOSE 3000
CMD ["npm","start"]
