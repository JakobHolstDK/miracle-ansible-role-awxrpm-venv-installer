FROM  redhat/ubi8
RUN echo hello
COPY . /opt/install
RUN yum clean all
RUN yum install -y python3-virtualenv redis-server
RUN python3 -m venv /opt/awx/virtualenv
RUN /opt/awx/virtualenv/bin/pip install --upgrade pip 
RUN /opt/awx/virtualenv/bin/pip install --upgrade ansible
RUN /opt/awx/virtualenv/bin/ansible-playbook /opt/awx/dockerplaybook.yml





