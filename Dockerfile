FROM ubuntu:23.04

# Install commonly used package
RUN apt-get update

RUN apt-get install -y \
    git \
    openssh-client \
    curl \
    python3 \
    libicu-dev

RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -c 7.0 --install-dir /opt/dotnet
RUN ln -s /opt/dotnet/dotnet /usr/local/bin/dotnet
RUN dotnet tool install Nuke.GlobalTool --global

# RUN useradd -ms /bin/bash -U ubuntu
RUN mkdir -p /home/ubuntu/.ssh
RUN mkdir -p /home/ubuntu/.config/NuGet
RUN mkdir -p /home/ubuntu/.nuget/NuGet
RUN chmod 700 /home/ubuntu/.ssh
RUN mkdir -p /app 
RUN chown -R ubuntu:ubuntu /app

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get clean
RUN apt-get autoremove -y

WORKDIR /home/ubuntu
USER ubuntu

ENTRYPOINT ["bash"]