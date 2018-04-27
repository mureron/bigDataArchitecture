# Parto de la imagen principal
FROM python3:0_0_1
LABEL maintainer="Ronal Muresano"

WORKDIR /BDaaS/
COPY startup-config.sh ./
COPY packages/ ./

RUN /bin/mkdir -p volumen/data

# Installing Jupyter 

# Adding an user to be used in the 
RUN useradd -m -s /bin/bash rmuresano  && echo rmuresano:123456 | chpasswd

RUN useradd -m -s /bin/bash lmontes  && echo lmontes:123456 | chpasswd

RUN apt-get -y update && apt-get -y install libpam0g-dev npm nodejs-legacy openssh-server &&  \
    npm install -g configurable-http-proxy && \
    conda install -c conda-forge jupyterhub && conda install notebook && \ 
    rm -rf /var/lib/apt/lists/*  && pip install -r lib_requirements.txt

CMD ["/BDaaS/startup-config.sh"]


