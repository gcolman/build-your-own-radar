FROM registry.redhat.io/rhel8/nodejs-10 as source
ADD app-src .
COPY /src/build-your-own-radar ./app-src
COPY package.json ./
RUN npm install
RUN npm run build

