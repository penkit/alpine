FROM alpine:3.5

# add penkit license to all downstream images
COPY LICENSE /PENKIT_LICENSE

# configure penkit public key
COPY penkit.rsa.pub /etc/apk/keys/

# run setup script to install necessary packages
COPY alpine-setup.sh /usr/local/sbin/
RUN alpine-setup.sh

# configure PS1 format and coloring
COPY set-ps1.sh /etc/profile.d/

# configure default entrypoint and command
COPY alpine-entrypoint.sh /usr/local/sbin/
ENTRYPOINT ["/usr/local/sbin/alpine-entrypoint.sh"]
CMD ["bash", "-l"]
