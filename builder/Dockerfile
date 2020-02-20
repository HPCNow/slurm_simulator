FROM centos:centos7.6.1810
MAINTAINER Jordi Blasco <jordi.blasco@gmail.com>
ADD http://snow.hpcnow.com/hpcnow.gpg.key /root/
RUN yum -y update && \
    yum clean all && \
    yum -y groupinstall 'Development Tools' && \
    yum -y install epel-release && \
    yum -y install \
        createrepo \
        curl \
        cython \
        freeipmi \
        freeipmi \
        git \
        gtk2 \
        gtk2-devel \
        hdf5 \
        hdf5-devel \
        hwloc \
        hwloc-devel \
        kernel-headers \
        libcgroup \
        libcgroup-devel \
        libcurl-devel \
        lua \
        lua-devel \
        mariadb \
        mariadb-devel \
        mariadb-libs \
        munge \
        munge-devel \
        ncurses \
        ncurses-devel \
        numactl \
        numactl-devel \
        openssl \
        openssl-devel \
        pam-devel \
        perl-DBI \
        perl-ExtUtils-MakeMaker \
        perl-Switch \
        readline-devel \
        rrdtool \
        rrdtool-devel \
        vim \
        wget && \
    yum clean all && \
    cp /root/hpcnow.gpg.key /etc/pki/rpm-gpg/RPM-GPG-KEY-HPCNOW && \
    mkdir /root/slurm

# Build Slurm
COPY rpmmacros /root/.rpmmacros
COPY build.sh .
COPY dependencies .
#ENTRYPOINT ["./build.sh"]

CMD ["/usr/bin/tail", "-f", "/dev/null"]
