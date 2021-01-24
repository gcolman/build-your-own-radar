FROM registry.redhat.io/rhel8/nodejs-10 as source
WORKDIR /src/build-your-own-radar
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build


