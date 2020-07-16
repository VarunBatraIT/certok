# The Build
FROM golang:alpine AS the-build
RUN apk add --no-cache git
RUN mkdir /src && cd /src && go get -v github.com/genuinetools/certok
RUN which certok
RUN ls -lah /go/bin/certok

# Copy Build
FROM alpine
WORKDIR /app
COPY --from=the-build /go/bin/certok /usr/bin/certok 
ENTRYPOINT ["certok"]
