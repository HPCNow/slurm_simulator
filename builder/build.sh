#!/bin/bash
SLURMVERSION=${1:-19.05.5}
cd /root/slurm
for i in $(cat /dependencies); do yum install --downloadonly --downloaddir=/usr/local/apache2/htdocs/rpm/centos/7/ $i; done
wget https://download.schedmd.com/slurm/slurm-$SLURMVERSION.tar.bz2 || wget http://www.schedmd.com/download/archive/slurm-$SLURMVERSION.tar.bz2
tar -jxvf slurm-$SLURMVERSION.tar.bz2
rm -f slurm-$SLURMVERSION.tar.bz2
cd slurm-$SLURMVERSION
patch slurm.spec < /root/slurm.spec.patch
patch src/slurmctld/proc_req.c < /root/proc_req.patch
cd -
tar -cf slurm-$SLURMVERSION.tar slurm-$SLURMVERSION
bzip2 slurm-$SLURMVERSION.tar
rpmbuild -ta --with lua --with pam slurm-$SLURMVERSION.tar.bz2 | tee rpmbuild-slurm-$SLURMVERSION.log
mkdir -p /root/slurm/x86_64/$SLURMVERSION
mv /root/rpmbuild/* /root/slurm/x86_64/$SLURMVERSION/
cd /usr/local/apache2/htdocs/rpm/centos/7/
find /root/slurm/x86_64/$SLURMVERSION/ -name "*.rpm" -exec cp {} . \;
rm -fr /root/slurm/x86_64/$SLURMVERSION/

