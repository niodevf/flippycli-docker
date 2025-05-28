FROM debian:latest

WORKDIR /var/flippydrive

ARG ARCH=amd64

RUN dpkg --add-architecture $ARCH
RUN apt update
RUN apt install binutils wget zip jq binutils -y

# Set environment variables
ENV REPO=OffBroadway/flippydrive-assets
# Download latest release asset
RUN LATEST_URL=$(wget -qO- https://api.github.com/repos/${REPO}/releases/latest | \
     jq -r '.assets[4].browser_download_url') && \
    wget -O latest-release.zip "$LATEST_URL"

EXPOSE 7031

RUN unzip latest-release.zip

RUN chmod +x flippy_cli_*

CMD ["./flippy_cli_1.4.2_linux_amd64", "."]