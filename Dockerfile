FROM alpine:3.5

# run setup script to install necessary packages
COPY alpine-setup.sh /usr/local/sbin/
RUN alpine-setup.sh

# configure penkit apk repo
RUN echo "@penkit http://apk.penkit.io/penkit/main" >> /etc/apk/repositories
COPY penkit.rsa.pub /etc/apk/keys/

# configure default entrypoint and command
COPY alpine-entrypoint.sh /usr/local/sbin/
ENTRYPOINT ["/usr/local/sbin/alpine-entrypoint.sh"]
CMD ["sh"]
