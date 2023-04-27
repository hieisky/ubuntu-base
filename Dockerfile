FROM ubuntu:23.04
USER root

# Install commonly used package
RUN apt-get update && \
    apt-get install -y \
    git \
    openssh-client \
    curl \
    python3 \
    libicu-dev

# Install .NET 7 SDK & NuGet
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -c 7.0 --install-dir /opt/dotnet
RUN ln -s /opt/dotnet/dotnet /usr/local/bin/dotnet
ENV PATH="${PATH}:/root/.dotnet/tools"
RUN dotnet tool install Nuke.GlobalTool --global


# Create a directory to mount the SSH keys
RUN mkdir /root/.ssh

# Create directory for NuGet
RUN mkdir -p /root/.config/NuGet && mkdir -p /root/.nuget/NuGet

# Set the proper permissions for the .ssh directory
RUN chmod 700 /root/.ssh

# Clean up 
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get clean
RUN apt-get autoremove -y

# Run a command to keep the container running
CMD ["bash"]