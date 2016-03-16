from alpine:3.3

run apk add --update wget openssl bash ca-certificates \
  && ln -sf /bin/bash /bin/sh \
  && rm -fr /var/lib/pkg/*

env GLIBC_PKG_VERSION=2.23-r1
env DOWN_URL=https://github.com/andyshinn/alpine-pkg-glibc/releases/download/2.23-r1

run wget -O /etc/apk/keys/andyshinn.rsa.pub "$DOWN_URL/andyshinn.rsa.pub" \
  && wget -O glibc-${GLIBC_PKG_VERSION}.apk "${DOWN_URL}/glibc-${GLIBC_PKG_VERSION}.apk" \
  && wget -O glibc-bin-${GLIBC_PKG_VERSION}.apk "${DOWN_URL}/glibc-bin-${GLIBC_PKG_VERSION}.apk" \
  && apk add glibc-${GLIBC_PKG_VERSION}.apk glibc-bin-${GLIBC_PKG_VERSION}.apk \
  && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
  && rm *.apk
  
CMD ["/bin/bash"]

