# syntax=docker/dockerfile:experimental

# Download wkhtmltopdf package stage
FROM buildpack-deps:stretch-curl as download

RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb

# Finally install stage
FROM debian:stretch

MAINTAINER Carlos Pavanetti <carlospavanetti.silvaprado@gmail.com>

# Mount .deb package from early stage image
RUN --mount=type=bind,from=download,target=wkhtmltox_0.12.5-1.stretch_amd64.deb,source=wkhtmltox_0.12.5-1.stretch_amd64.deb,rw \ 
# Synchronize apt index, install wkhtmltopdf with required dependencies and remove index
    apt-get update && \
    apt-get install -y --no-install-recommends /wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

# Define default command as help option for the entrypoint wkhtmltopdf
ENTRYPOINT ["wkhtmltopdf"]
CMD ["-h"]

