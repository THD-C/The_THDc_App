FROM grafana/grafana-enterprise:11.1.4

USER root
RUN apk add curl

# Set timezone
ENV TZ="Europe/Warsaw"
RUN apk add --no-cache tzdata

EXPOSE 3000

ENTRYPOINT [ "/run.sh" ]