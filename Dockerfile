FROM golang:1.10-alpine
VOLUME /tmp
RUN apk -U add ca-certificates
ADD kafkabeat.yml /tmp/kafkabeat.yml
RUN apk --update add git openssh && apk add build-base && apk add bash && rm -rf /var/lib/apt/lists/* && rm /var/cache/apk/*
RUN go get github.com/justsocialapps/kafkabeat
RUN echo $GOPATH
RUN cd $GOPATH/src/github.com/justsocialapps/kafkabeat && make
RUN ls -ltr $GOPATH/src/github.com/justsocialapps/kafkabeat
RUN ls /tmp
ENTRYPOINT [ "/go/src/github.com/justsocialapps/kafkabeat/kafkabeat", "-c" ,"/tmp/kafkabeat.yml","-e","-d","\"*\""]
