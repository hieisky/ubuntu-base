FROM ubuntu:latest
USER root

# Install commonly used package
RUN apt-get update && \
    apt-get install -y \
    git \
    openssh-client \
    curl \
    nano \
    python3.9 \
    python3-pip

# Install .NET 7 SDK
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -c 7.0 --install-dir /opt/dotnet

# Create a directory to mount the SSH keys
RUN mkdir /root/.ssh

# Set the proper permissions for the .ssh directory
RUN chmod 700 /root/.ssh

# Run a command to keep the container running
CMD ["sleep", "infinity"]
