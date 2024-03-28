FROM python:3.11-slim

# Let the user opt-out of SSL verification
ARG apt_options="-o Acquire::https::Verify-Peer=false"

# Set the environment variable
ENV PYTHONDONTWRITEBYTECODE 1

# Set the working directory
WORKDIR /app

RUN apt-get update $apt_options \
    && apt-get install -y $apt_options \
      gcc \
      g++ \
      zsh \
      git \
      curl \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
RUN pip install --upgrade pip \
    && pip install --upgrade setuptools wheel \
    && pip install nuitka

CMD ["/bin/zsh"]
