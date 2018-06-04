# Parto de la imagen principal
FROM  python2:0_0_1
LABEL maintainer="Ronal Muresano"

WORKDIR /BDaaS/dependencies

RUN /bin/mkdir -p volumen/data


# Installing Jupyter lab and R

# Install Ipython R kernel dependencies
#RUN apt-get -y update && apt-get install libxrender1 
# && rm -rf /var/lib/apt/lists/* 

RUN conda install -c conda-forge jupyterlab 

COPY packages/ ./



# make sure apt is up to date
RUN apt-get update --fix-missing
RUN apt-get install -y curl
RUN apt-get install -y build-essential libssl-dev

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.9.4

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Install Nodejs

RUN conda install -c conda-forge nodejs

# Install Interactive Lib for JupyterLab
RUN jupyter labextension install jupyterlab_bokeh

#Installing dependencies
#RUN  pip install -r lib_requirements.txt 

#Installing Support to R

#RUN conda install -c r r-base r-irkernel r-irdisplay \
#    && conda install -c r rpy2  

#RUN apt-get -y update && apt-get install -y pandoc 
#RUN R -e "IRkernel::installspec(user = FALSE)"  


COPY startup-config.sh ./

CMD ["/BDaaS/dependencies/startup-config.sh"]

