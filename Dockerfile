FROM eclipse-temurin:20-jre-alpine

RUN apk --update --no-cache add nodejs npm jq curl bash git docker maven

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
