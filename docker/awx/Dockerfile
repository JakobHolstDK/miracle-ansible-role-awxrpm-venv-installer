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
RUN mkdir -p /var/run/tower
RUN chown awx:awx /var/run/tower

WORKDIR /tmp
RUN git clone https://github.com/ansible/awx.git
RUN git clone https://github.com/nodejs/node.git

RUN /opt/awx/virtualenv/bin/pip install django-debug-toolbar
RUN /opt/awx/virtualenv/bin/pip install ansible_runner
RUN /opt/awx/virtualenv/bin/pip install django-rest-swagger
RUN /opt/awx/virtualenv/bin/pip install django

WORKDIR /tmp/node
RUN ./configure
RUN make -j 8

RUN cp node /usr/bin/node

COPY files/tower.conf /etc/tower/tower.conf
COPY files/createsecret.py /usr/bin/createsecret.py
COPY files/settings.py /etc/tower/settings.py
COPY files/logrotate_awx_supervisord /etc/logrotate.d/awx_supervisord
COPY files/logrotate_cron.hourly     /etc/cron.hourly/logrotate

RUN chmod 755 /usr/bin/createsecret.py
RUN createsecret.py > /etc/tower/SECRET_KEY

RUN mkdir /var/lib/awx/.ssh 
RUN mkdir /var/lib/awx/projects
RUN mkdir /var/lib/awx/job_status
RUN mkdir /var/lib/awx/public 
RUN mkdir /var/log/tower

RUN chown -R awx:awx /var/lib/awx
RUN chown -R root:awx /etc/tower/conf.d
RUN chown -R awx:awx /var/log/tower

RUN mkdir /etc/systemd/system/nginx.service.d
RUN mkdir /etc/systemd/system/supervisord.service.d






















