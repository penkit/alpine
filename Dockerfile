FROM alpine:3.5

# configure penkit public key
COPY penkit.rsa.pub /etc/apk/keys/

# run setup script to install necessary packages
COPY alpine-setup.sh /usr/local/sbin/
RUN alpine-setup.sh

# configure default entrypoint and command
COPY alpine-entrypoint.sh /usr/local/sbin/
ENTRYPOINT ["/usr/local/sbin/alpine-entrypoint.sh"]
CMD ["bash"]
