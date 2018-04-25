# Parto de la imagen principal
FROM basicbd3
LABEL maintainer="Ronal Muresano"

WORKDIR /BDaaS/

COPY startup-config.sh ./
COPY requirements.txt ./
COPY jupyterhub_config.py /BDaaS/dependencies/miniconda/bin

# Installing Jupyter 

RUN useradd -m -s /bin/bash rmuresano  && echo rmuresano:123456 | chpasswd

RUN useradd -m -s /bin/bash lmontes  && echo lmontes:123456 | chpasswd

RUN apt-get -y update && apt-get -y install libpam0g-dev npm nodejs-legacy openssh-server &&  npm install -g configurable-http-proxy && \
    conda install -c conda-forge jupyterhub && conda install notebook && rm -rf /var/lib/apt/lists/*  && pip install -r requirements.txt



CMD ["/BDaaS/startup-config.sh"]


