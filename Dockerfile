FROM centos:7

RUN yum clean all \
    && yum makecache fast \
    && yum install yum-utils device-mapper-persistent-data lvm2 axel git make gcc -y
    
