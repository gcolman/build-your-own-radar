FROM registry.redhat.io/ubi8/nodejs-10
USER 0
ADD src /opt/app-root/src
RUN chown -R 1001:0 /opt/app-root/
USER 1001

COPY package.json /opt/app-root/
WORKDIR /opt/app-root/

RUN npm install
COPY . ./
RUN npm run build
