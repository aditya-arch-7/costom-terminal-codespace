FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PORT=7681

# Install ttyd and common terminal tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    nano \
    bash \
    build-essential \
    ttyd \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 7681

# Launch ttyd on the port assigned by Render with write access (-W)
CMD ["sh", "-c", "ttyd -p ${PORT} -W bash"]
