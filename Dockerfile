FROM ubuntu:xenial

RUN apt-get update &&\
    apt-get install -y git-core subversion wget bzip2 unzip \
                       gcc g++ make ccache libncurses5-dev zlib1g-dev \
                       python gawk sudo groff-base &&\
    apt-get remove -y openssh-client manpages manpages-dev krb5-locales locales &&\
    apt-get -y autoremove &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt
RUN sudo -iu openwrt git clone --depth=1 git://git.openwrt.org/15.05/openwrt.git &&\
    sudo -iu openwrt openwrt/scripts/feeds update -a
