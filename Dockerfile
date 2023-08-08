FROM alpine:3.16

RUN apk --update --no-cache add nodejs npm jq curl bash git docker openjdk20-jre maven

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
