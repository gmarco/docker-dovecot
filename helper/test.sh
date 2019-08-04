docker build -t dovecot .
docker run -it -v /tmp/dovecot:/etc/dovecot dovecot 
