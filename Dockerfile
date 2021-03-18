FROM cimg/android:29.0

ARG FLUTTER_VER="2.0.2-stable"

ENV PATH="/usr/local/bin/flutter/bin:${PATH}"
# Install and pre-cache Flutter.
RUN wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${FLUTTER_VER}.tar.xz && \
  tar xf flutter_linux_${FLUTTER_VER}.tar.xz -C /usr/local/bin && \
  rm flutter_linux_${FLUTTER_VER}.tar.xz

RUN flutter precache --no-web --no-linux --no-windows --no-fuchsia --no-ios --no-macos && \
    apt update && \
    apt install -y ruby ruby-dev rubygems && \
    gem install fastlane -NV && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g appcenter-cli
