FROM buildpack-deps:buster-curl

MAINTAINER Carlos Pavanetti <carlospavanetti.silvaprado@gmail.com>

RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb && \
    apt-get update && \
    dpkg -i wkhtmltox_0.12.5-1.buster_amd64.deb || \
    apt-get install -f -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["whtmltopdf"]
CMD ["-h"]

