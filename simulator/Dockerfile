FROM centos:centos7.6.1810
MAINTAINER Jordi Blasco <jordi.blasco@gmail.com>
ADD http://snow.hpcnow.com/hpcnow.gpg.key /root/
RUN yum -y update && \
    yum clean all && \
    yum -y install epel-release && \
    yum-config-manager --add-repo http://snow.hpcnow.com/training/simulator/hpcnow-centos7.repo && \
    yum -y install \
        curl \
        cython \
        freeipmi \
        freeipmi \
        hdf5 \
        hwloc \
        libcgroup \
        lua \
        mariadb \
        munge \
        ncurses \
        numactl \
        openssl \
        perl-DBI \
        perl-ExtUtils-MakeMaker \
        perl-Switch \
        rrdtool \
        slurm \
        slurm-slurmctld \
        slurm-slurmd \
        slurm-slurmdbd \
        slurm-contribs \
        wget && \
    yum clean all && \
    cp /root/hpcnow.gpg.key /etc/pki/rpm-gpg/RPM-GPG-KEY-HPCNOW && \
    mkdir /root/slurm
# copy config files
COPY slurm_config/* /etc/slurm/
CMD ["/usr/bin/tail", "-f", "/dev/null"]
