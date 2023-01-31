FROM  redhat/ubi8
RUN echo hello
COPY . /opt/install
RUN yum clean all
RUN yum install -y python3-virtualenv
RUN python3 -m venv /opt/awx/virtualenv
RUN /opt/awx/virtualenv/bin/pip install --upgrade pip 
RUN pip install --upgrade ansible





