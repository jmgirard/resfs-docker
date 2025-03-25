FROM jmgirard/rocker-bayes:noble-amd64

# Copy mount script to container
COPY ../scripts/mount.sh /usr/local/bin/mount.sh
RUN chmod +x /usr/local/bin/mount.sh

# Install dependencies
RUN apt-get update \
    && apt-get install -y curl bash apt-utils cifs-utils \
    && rm -rf /var/lib/apt/lists/* \
    && curl -Ls https://cli.doppler.com/install.sh | sh
