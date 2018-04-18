# Parto de la imagen principal
FROM basicbd3
LABEL maintainer="Ronal Muresano"

WORKDIR /BDaaS/

RUN /bin/mkdir -p volumen/data
COPY startup-config.sh ./
COPY jupyter_notebook_config.py /BDaaS/dependencies/miniconda/bin
COPY requirements.txt ./

# Installing Jupyter 

# Install Ipython R kernel dependencies
RUN apt-get -y update && apt-get install libxrender1 && rm -rf /var/lib/apt/lists/* 

RUN conda install -c conda-forge jupyterlab && pip install -r requirements.txt \ 
    conda install -c r-base r-irkernel r-irdisplay && \
    
    conda install -c r rpy2 && \ 
    R -e "IRkernel::installspec(user = FALSE)"  && \
    conda clean -p

CMD ["/BDaaS/startup-config.sh"]

