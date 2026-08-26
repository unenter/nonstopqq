FROM jlesage/baseimage-gui:debian-13-v4.11.3

ARG QQ_VER=3.2.32_260812

ENV APP_NAME="QQ"
ENV NOVNC_LANGUAGE="zh_Hans"
ENV TZ=Asia/Shanghai
ENV HOME=/config
ENV LC_ALL=C
ENV ENABLE_DISABLE_GPU=false

COPY --chmod=755 root /
COPY --chmod=755 startapp.sh /startapp.sh

RUN (sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list.d/debian.sources || sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list) \
    && apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates wget libnss3 libxss1 desktop-file-utils libasound2 ttf-wqy-zenhei libgtk-3-0 libgbm1 libnotify4 \
                         xdg-utils libsecret-common libsecret-1-0 libdbusmenu-glib4 libdbusmenu-gtk3-4 procps \
                         libayatana-indicator3-7 libayatana-appindicator3-1 libayatana-ido3-0.4-0 libxtst6 libx11-xcb1 x11-xserver-utils \
    && if [ "$(uname -m)" = "x86_64" ]; then \
          QQ_ARCH="amd64_01"; \
       elif [ "$(uname -m)" = "aarch64" ]; then \
          QQ_ARCH="arm64_01"; \
       fi \
    && wget https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_${QQ_VER}_${QQ_ARCH}.deb \
    && dpkg -i QQ_${QQ_VER}_${QQ_ARCH}.deb || apt-get install -f -y \
    && rm QQ_${QQ_VER}_${QQ_ARCH}.deb \
    && sed -i 's@<decor>no<\/decor>@<decor>yes<\/decor>@g' /opt/base/etc/openbox/rc.xml.template \
    && mv /opt/noVNC/index.html /opt/noVNC/index.html.en \
    && sed -i '/messagebus/d' /var/lib/dpkg/statoverride
    
