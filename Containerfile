FROM ubuntu:18.04
ENV container=docker

ENV CONTAINER=docker
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        aptitude \
        bash \
        ca-certificates \
        curl \
        iproute2 \
        libcap2-bin \
        python3-apt \
        python3-pip \
        software-properties-common \
        sudo \
        systemd \
        systemd-cron \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

RUN pip3 install ansible q

RUN mkdir -p /etc/ansible \
    && echo '[local]\nlocalhost ansible_connection=local ansible_python_interpreter=/usr/bin/python3' > /etc/ansible/hosts

CMD ["/bin/systemd"]
