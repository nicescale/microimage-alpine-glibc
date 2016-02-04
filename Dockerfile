from alpine:3.3

run apk add --update wget openssl bash curl \
  bash-completion coreutils bind-tools sed grep \
  && ln -sf /bin/bash /bin/sh \
  && rm -fr /var/lib/pkg/*

run wget -O /tmp/glibc.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" \
  && apk add --allow-untrusted /tmp/glibc.apk \
  && /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib \
  && rm /tmp/glibc.apk
