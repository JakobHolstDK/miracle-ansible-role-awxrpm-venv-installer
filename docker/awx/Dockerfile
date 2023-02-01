FROM fedora
RUN dnf clean all
RUN dnf install -y python3-virtualenv git jq redis nginx git python3-virtualenv \
    gcc-c++ npm device-mapper-persistent-data lvm2 bzip2 python3-pip ansible gcc openldap-devel xmlsec1-openssl \
    python3.8 ansible-collection-ansible-posix supervisor

RUN dnf install -y         \
      xmlsec1-devel        \
      libtool-ltdl-devel   \
      mlocate              \
      libpq-devel 

RUN python3 -m venv /opt/awx/virtualenv
RUN /opt/awx/virtualenv/bin/pip install --upgrade pip 
RUN /opt/awx/virtualenv/bin/pip install --upgrade ansible
RUN /opt/awx/virtualenv/bin/pip install --upgrade wheel

RUN useradd -m  awx

RUN mkdir /var/log/tower
RUN chown awx:awx /var/log/tower
RUN mkdir -p /var/lib/awx/rsyslog
RUN chown awx:awx /var/lib/awx/rsyslog

RUN mkdir -p /etc/tower/conf.d
RUN chown awx:awx /etc/tower/conf.d
RUN mkdir -p /run/tower
RUN chown awx:awx /run/tower

WORKDIR /tmp
RUN git clone https://github.com/ansible/awx.git
RUN git clone https://github.com/nodejs/node.git

RUN /opt/awx/virtualenv/bin/pip install django-debug-toolbar
RUN /opt/awx/virtualenv/bin/pip install ansible_runner
RUN /opt/awx/virtualenv/bin/pip install django-rest-swagger


WORKDIR /tmp/node
RUN ./configure
RUN make -j 8













