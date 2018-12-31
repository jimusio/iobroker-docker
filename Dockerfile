FROM node:8-jessie

MAINTAINER SchumyHao

RUN mkdir -p /opt/scripts/ && chmod 777 /opt/scripts/
WORKDIR /opt/scripts/
ADD iobroker_startup.sh iobroker_startup.sh
RUN chmod +x iobroker_startup.sh

RUN mkdir -p /opt/iobroker/ && chmod 777 /opt/iobroker/
WORKDIR /opt/iobroker/

RUN npm install iobroker --unsafe-perm && \
    npm i --production --unsafe-perm && \
    update-rc.d iobroker.sh remove && \
    echo $(hostname) > .install_host
CMD ["sh", "/opt/scripts/iobroker_startup.sh"]
