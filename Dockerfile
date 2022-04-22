FROM ubuntu:latest as joal

WORKDIR /home/



RUN apt update \
&& apt install wget unzip -y \
&& wget -O joal.zip --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/base/joal-base-seed.zip" \
&& wget -O t1.zip --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/11-213/torrents-hdhome.zip"  \
&& wget -O t2.zip --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/11-213/torrents-hdhome2.zip" \
&& mkdir joal \
&& unzip -o joal.zip -d joal \
#&& unzip -o t1.zip -d joal \
#&& unzip -o t2.zip -d joal \
&& ls

FROM adoptopenjdk:11.0.11_9-jre-hotspot
#tt
COPY --from=joal /home/joal /home/joal
# Run bot script:
CMD java -jar  /home/joal/joal.jar --joal-conf="/home/joal/" --spring.main.web-environment=true --server.port=8080 --joal.ui.path.prefix="q" --joal.ui.secret-token="q"
