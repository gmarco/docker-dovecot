FROM alpine:3.10

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk add --no-cache \
     dovecot dovecot-lmtpd dovecot-sqlite dovecot-pigeonhole-plugin dovecot-pigeonhole-plugin-ldap postfix

COPY start.sh /start.sh

CMD /start.sh
