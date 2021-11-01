FROM ubuntu:latest as joal

WORKDIR /home/



RUN apt update \
&& apt install wget unzip -y \
&& wget --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/base/joal-base-slow.zip" \
&& wget --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/5/torrents.zip" \
&& mkdir joal \
&& unzip -o joal-base-slow.zip -d joal \
&& unzip -o torrents.zip -d joal \
&& df -h

FROM adoptopenjdk:11.0.11_9-jre-hotspot
#tt
COPY --from=joal /home/joal /home/joal
# Run bot script:
CMD java -Xmx500M -jar  /home/joal/jack-of-all-trades-2.1.26.jar  --joal-conf="/home/joal/"
