FROM alpine:3.12

RUN apk add --no-cache \
     dovecot dovecot-lmtpd dovecot-sqlite dovecot-pigeonhole-plugin dovecot-pigeonhole-plugin-ldap postfix

COPY start.sh /start.sh

CMD /start.sh
