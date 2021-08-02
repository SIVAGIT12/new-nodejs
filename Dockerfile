FROM alpine:latest
RUN apk add
WORKDIR /app
COPY . /app
RUN npm install
EXPOSE 3000
CMD ["npm","start"]
