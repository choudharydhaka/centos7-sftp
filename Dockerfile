##
# CentOS 7 plus SFTP
##
FROM centos:centos7
MAINTAINER Suresh Dhaka <choudhary1.dhaka@gmail.com>

# some env
ENV REFRESHED_AT 2019-05-15

# install SSH
RUN yum -y install openssh-server && \
    yum clean all

# sshd needs this directory to run
RUN mkdir -p /var/run/sshd

# add configuration and script
ADD . /root
WORKDIR /root
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key 

RUN mv sshd_config /etc/ssh/sshd_config && \
    chmod +x run && \
    echo 'SSHD: ALL' >> /etc/hosts.allow

EXPOSE 22

ENTRYPOINT ["./run"]
