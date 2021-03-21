FROM debian:10.8-slim

ARG FLUTTER_VER="2.0.2-stable"

ENV PATH="/usr/local/bin/flutter/bin:${PATH}"
# Install and pre-cache Flutter.
RUN apt update && apt install -y wget git xz-utils && \
  wget https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${FLUTTER_VER}.tar.xz && \
  tar vxf flutter_linux_${FLUTTER_VER}.tar.xz -C /usr/local/bin && \
  rm flutter_linux_${FLUTTER_VER}.tar.xz && \
  flutter precache --no-web --no-linux --no-windows --no-fuchsia --no-ios --no-macos