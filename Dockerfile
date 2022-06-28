#
# Troglobyte AppHub:
# author: Michael Gene Brockus
# mail: <mailto: michaelbrockus@gmail.com>
#
FROM opensuse/tumbleweed:latest AS dummy

# setting basic image info
ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

FROM dummy AS getter

RUN zypper --non-interactive patch --with-update --with-optional && \
    zypper --non-interactive update && \
    zypper install -y \
    python3-pip \
  python3 \
  python3-devel \
  #ninja \
  git \
  patch \
  elfutils \
  gcc \
  gcc-c++

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.62.0 \
       ninja==1.10.0.post2 \
       scan-build
