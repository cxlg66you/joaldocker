FROM ubuntu:latest as joal

WORKDIR /home/

RUN apt update \
&& apt install wget unzip -y \
&& wget --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/q/joal.zip" \
&& mkdir joal \
&& unzip joal.zip -d joal

FROM adoptopenjdk:11.0.11_9-jre-hotspot

COPY --from=joal /home/joal /home/joal
# Run bot script:
CMD java -Xmx480M -jar  /home/joal/jack-of-all-trades-2.1.26.jar  --joal-conf="/home/joal/"
