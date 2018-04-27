# Parto de la imagen principal
FROM  python3:0_0_1
LABEL maintainer="Ronal Muresano"

WORKDIR /BDaaS/

COPY startup-config.sh ./
COPY packages/ ./

RUN /bin/mkdir -p volumen/data

# Installing Jupyter lab and R

# Install Ipython R kernel dependencies
RUN apt-get -y update && apt-get install libxrender1 && rm -rf /var/lib/apt/lists/* 

RUN conda install -c conda-forge jupyterlab && pip install -r lib_requirements.txt && \ 
    conda install -c r r-base r-irkernel r-irdisplay && \
    conda install -c r rpy2 && \ 
    R -e "IRkernel::installspec(user = FALSE)"  && \
    conda clean -p

CMD ["/BDaaS/startup-config.sh"]

