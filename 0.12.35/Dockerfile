FROM frolvlad/alpine-glibc:alpine-3.4

COPY ./factorio.crt /opt/factorio.crt

ENV VERSION=0.12.35 \
    SHA1=ea15636469148662c26786ad916ac066ee5aab56

RUN apk --no-cache add curl tini pwgen && \
    curl -sSL --cacert /opt/factorio.crt \
        https://www.factorio.com/get-download/$VERSION/headless/linux64 \
        -o /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    echo "$SHA1  /tmp/factorio_headless_x64_$VERSION.tar.gz" | sha1sum -c && \
    tar xzf /tmp/factorio_headless_x64_$VERSION.tar.gz --directory /opt && \
    rm /tmp/factorio_headless_x64_$VERSION.tar.gz && \
    apk del curl

VOLUME /opt/factorio

EXPOSE 34197/udp 27015/tcp

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/docker-entrypoint.sh"]
