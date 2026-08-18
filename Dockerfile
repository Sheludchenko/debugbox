FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETARCH
ARG SQLCMD_VERSION=1.10.0
ARG TCPING_VERSION=2.8.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        dnsutils \
        iproute2 \
        iputils-ping \
        netcat-openbsd \
        traceroute \
        tcpdump \
        openssl \
        jq \
        yq \
        postgresql-client \
        default-mysql-client \
        bzip2 \
    && curl -fsSL "https://github.com/microsoft/go-sqlcmd/releases/download/v${SQLCMD_VERSION}/sqlcmd-linux-${TARGETARCH}.tar.bz2" \
        | tar -xjf - -C /usr/local/bin sqlcmd \
    && chmod +x /usr/local/bin/sqlcmd \
    && curl -fsSL "https://github.com/pouriyajamshidi/tcping/releases/download/v${TCPING_VERSION}/tcping-linux-${TARGETARCH}-static.tar.gz" \
        | tar -xzf - -C /usr/local/bin tcping \
    && chmod +x /usr/local/bin/tcping \
    && apt-get purge -y --auto-remove bzip2 \
    && rm -rf /var/lib/apt/lists/*

RUN printf '\nalias cls=clear\n' >> /etc/bash.bashrc \
    && printf '\nalias cls=clear\n' >> /root/.bashrc

CMD ["/bin/bash"]
