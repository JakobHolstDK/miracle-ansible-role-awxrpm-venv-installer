FROM  redhat/ubi8
RUN echo hello
COPY . /opt/install
RUN yum clean all
RUN yum install -y python3-virtualenv




