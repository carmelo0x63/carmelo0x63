FROM alpine:3.20

LABEL org.opencontainers.image.authors="carmelo.califano@gmail.com"

ENV DESTDIR=/app

RUN apk --no-cache add git groff

WORKDIR ${DESTDIR}

RUN adduser -h ${DESTDIR} -D user

RUN git clone --depth=1 https://github.com/carmelo0x63/carmelo0x63.git .

USER user

CMD ["/usr/bin/groff", "-man", "-Tascii", "carmelo.7"]
