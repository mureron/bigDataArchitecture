# Parto de la imagen principal
FROM python3:0_0_1
LABEL maintainer="Radiatus Team"

WORKDIR /eslap/legacy

COPY startup-config.sh ./
COPY packages/ ./

RUN /bin/mkdir -p volumen/data

# Installing Jupyter 

# Install Ipython R kernel dependencies
RUN apt-get -y update && apt-get install -y libxrender1 ttf-ubuntu-font-family && \ 
    rm -rf /var/lib/apt/lists/*  
RUN conda install -y -c conda-forge jupyter
RUN pip install -r lib_requirements.txt && \ 
    conda install -c r r-base  r-irkernel r-irdisplay && \ 
    conda install -c r rpy2 && \ 
    R -e "IRkernel::installspec(user = FALSE)"  && \
    conda clean -p

ENTRYPOINT ./startup-config.sh
