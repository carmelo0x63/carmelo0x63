FROM alpine:3.22 AS gitloader
LABEL org.opencontainers.image.authors="carmelo[DOT]califano[AT]gmail[DOT]com"
ENV DESTDIR=/app
RUN apk --no-cache add git
WORKDIR ${DESTDIR}
RUN git clone --depth=1 https://github.com/carmelo0x63/carmelo0x63.git .

FROM alpine:3.22 AS runtime
LABEL org.opencontainers.image.authors="carmelo[DOT]califano[AT]gmail[DOT]com"
ENV DESTDIR=/app
RUN apk --no-cache add groff
WORKDIR ${DESTDIR}
RUN adduser -h ${DESTDIR} -D user
USER user
COPY --from=gitloader ${DESTDIR}/carmelo.7 .
CMD ["/usr/bin/groff", "-man", "-Tascii", "carmelo.7"]
