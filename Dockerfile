FROM ubuntu
RUN echo hello
COPY . /opt/install
RUN apt update
RUN apt install -y python3-venv
RUN python3 -m venv /opt/awx/virtualenv
RUN /opt/awx/virtualenv/bin/pip install --upgrade pip 
RUN /opt/awx/virtualenv/bin/pip install --upgrade ansible
#RUN /opt/awx/virtualenv/bin/ansible-galaxy role install -fr /opt/install/roles/requirements.yaml
#RUN /opt/awx/virtualenv/bin/ansible-playbook /opt/install/dockerplaybook.yml





