FROM registry.redhat.io/ubi8/nodejs-10 as source

USER 0
ADD app-src /tmp/src
RUN chown -R 1001:0 /tmp/src
USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run
