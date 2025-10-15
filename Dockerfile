# ---- STAGE 1: build fts_xapian ----
FROM alpine:3.22 AS builder

# Install build dependencies
RUN apk add --no-cache \
    git make g++ dovecot-dev xapian-core-dev

# Build fts_xapian
WORKDIR /usr/src
RUN git clone https://github.com/grosjo/fts-xapian.git
WORKDIR /usr/src/fts-xapian
RUN make && make install DESTDIR=/tmp/installroot

# ---- STAGE 2: runtime ----

FROM alpine:3.22

RUN apk add --no-cache \
     dovecot dovecot-lmtpd dovecot-sqlite dovecot-pigeonhole-plugin dovecot-pigeonhole-plugin-ldap postfix xapian-core

# Copy compiled plugin from builder stage
COPY --from=builder /tmp/installroot/usr/lib/dovecot/modules/fts/fts_xapian.so /usr/lib/dovecot/modules/fts/

COPY start.sh /start.sh

CMD /start.sh
