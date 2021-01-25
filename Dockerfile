FROM registry.redhat.io/ubi8/nodejs-10
USER 0
ADD src /tmp/src
RUN chown -R 1001:0 /tmp/src
USER 1001

COPY package.json /opt/app-root/src/

# Install the dependencies
RUN /usr/libexec/s2i/assemble

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run
