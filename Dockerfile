# Install Operating system and dependencies
FROM ubuntu:22.04

RUN apt-get update 

RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter


# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

ENV TAR_OPTIONS=--no-same-owner
#RUN cd /usr/local/flutter/bin
#RUN pwd
#RUN ls -a
#RUN mkdir /usr/local/flutter/bin/cache/artifacts/gradle_wrapper
#RUN wget -c https://storage.googleapis.com/flutter_infra_release/gradle-wrapper/fd5c1f2c013565a3bea56ada6df9d2b8e96d56aa/gradle-wrapper.tgz -O - | tar -xz -C /usr/local/flutter/bin/cache/artifacts/gradle_wrapper
#RUN cat /etc/subgid


# Enable flutter web
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web

# Run flutter doctor
RUN flutter doctor


# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/

RUN flutter clean
#RUN flutter packages get
#RUN flutter packages upgrade
RUN flutter pub get
RUN flutter pub cache repair
RUN flutter build web -t /app/lib/main.dart --no-tree-shake-icons

# Record the exposed port
EXPOSE 5000

# make server startup script executable and start the web server
RUN ["chmod", "u+x", "/app/server/server.sh"]

ENTRYPOINT ["sh", "/app/server/server.sh"]
