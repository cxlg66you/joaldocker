FROM ubuntu:latest as joal

WORKDIR /home/

RUN apt update \
&& apt install wget unzip -y \
&& wget --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/base/joal-base.zip" \
&& wget --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/10-28/torrents.zip" \
&& mkdir joal \
&& unzip joal-base.zip -d joal \
&& unzip torrents.zip -d joal \
&& ls

FROM adoptopenjdk:11.0.11_9-jre-hotspot
#tt
COPY --from=joal /home/joal /home/joal
# Run bot script:
CMD java -Xmx500M -jar  /home/joal/jack-of-all-trades-2.1.26.jar  --joal-conf="/home/joal/"
