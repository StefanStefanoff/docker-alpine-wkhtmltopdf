FROM alpine:3.13

RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family

# On alpine static compiled patched qt headless wkhtmltopdf (46.8 MB).
COPY --from=atrelios/docker-alpine-wkhtmltopdf:build /bin/wkhtmltopdf /bin/wkhtmltopdf

ENTRYPOINT ["wkhtmltopdf"]
