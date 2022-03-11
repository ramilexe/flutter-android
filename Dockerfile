FROM cimg/android:2021.08.1

USER root

RUN id

ARG FLUTTER_VER="2.10.3-stable"

ENV PATH="/usr/local/bin/flutter/bin:${PATH}"
# Install and pre-cache Flutter.
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VER}.tar.xz && \
  tar xf /home/circleci/project/flutter_linux_${FLUTTER_VER}.tar.xz -C /usr/local/bin && \
  rm /home/circleci/project/flutter_linux_${FLUTTER_VER}.tar.xz

RUN flutter precache --no-web --no-linux --no-windows --no-fuchsia --no-ios --no-macos && \
    apt update && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g appcenter-cli
