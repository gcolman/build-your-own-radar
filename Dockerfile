FROM registry.redhat.io/rhel8/nodejs-10 as source
#ADD app-src .
#COPY /src/build-your-own-radar ./app-src
#COPY package.json ./
#RUN npm install
#RUN npm run build

USER 0
ADD app-src /tmp/src
RUN chown -R 1001:0 /tmp/src
USER 1001

COPY /src/build-your-own-radar ./app-src
COPY package.json ./
RUN npm install
RUN npm run build

# Install the dependencies
RUN /usr/libexec/s2i/assemble

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run

