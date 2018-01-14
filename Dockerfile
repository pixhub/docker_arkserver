FROM debian:9

RUN useradd -ms /bin/bash ark && \
    echo "session required pam_limits.so" >> /etc/pam.d/common-session && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
            apt-utils \
            build-essential \
            wget \
            curl \
            wget \
            file \
            bzip2 \
            gzip \
            unzip \
            bsdmainutils \
            python \
            util-linux \
            ca-certificates \
            binutils \
            bc \
            python \
            util-linux \
            tmux \
            libstdc++6 \
            libstdc++6:i386

USER ark

RUN mkdir /home/ark/steamcmd && \
    mkdir /home/ark/ark-server && \
    mkdir /home/ark/ark-config.BKP && \
    cd /home/ark/steamcmd && \
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
    tar xzvf steamcmd_linux.tar.gz && \
    ./steamcmd.sh +login anonymous \
                  +force_install_dir /home/ark/ark-server \
                  +app_update 376030 \
                  +quit && \
    cp -r /home/ark/ark-server/ShooterGame/Config/* /home/ark/ark-config.BKP/

COPY files /

CMD ["/run.sh"]
