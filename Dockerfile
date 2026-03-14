FROM alpine:3.23
LABEL org.opencontainers.image.authors="carmelo[DOT]califano[AT]gmail[DOT]com"
ENV DESTDIR=/app
RUN apk --no-cache add curl groff
WORKDIR ${DESTDIR}
RUN adduser -h ${DESTDIR} -D user
USER user
CMD ["sh", "-c", "curl -fsSL -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/carmelo0x63/carmelo0x63/main/carmelo.7 -o carmelo.7 && /usr/bin/groff -man -Tascii carmelo.7"]
