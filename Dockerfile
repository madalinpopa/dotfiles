FROM python:bookworm

# Update and install minimum software
RUN --mount=type=cache,target=/var/cache/apt-base \
    apt-get update && \
    apt-get install -y --no-install-recommends gcc git sudo make

# Create user and their home folder and set bash as default shell
RUN useradd -ms /bin/bash madalin && \
    echo "madalin:pass" | chpasswd && \
    echo "root:pass" | chpasswd && \
    usermod -aG sudo madalin

# Set user session
USER madalin

# Set workdir user home
WORKDIR /home/madalin

# Copy dotfiles in user home
COPY . dotfiles/

# Start a bash session
ENTRYPOINT [ "bash" ]
