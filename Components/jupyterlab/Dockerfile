# Parto de la imagen principal
FROM  python3:0_0_1
LABEL maintainer="Radiatus Team"

WORKDIR /eslap/legacy

RUN /bin/mkdir -p volumen/data

# Installing Jupyter lab and R

# Install Ipython R kernel dependencies
#RUN apt-get -y update && apt-get install libxrender1 \\
#    && rm -rf /var/lib/apt/lists/* 

RUN conda install -c conda-forge jupyterlab  
RUN conda install -c numpy pandas scipy scikit-learn

#&& pip install -r lib_requirements.txt 

     #&& \     conda install -c r r-base r-irkernel r-irdisplay && \
#    conda install -c r rpy2 && \ 

#RUN apt-get -y update && apt-get install -y pandoc 
#RUN R -e "IRkernel::installspec(user = FALSE)"  

COPY startup-config.sh ./
COPY packages/ ./

ENTRYPOINT ./startup-config.sh
