FROM ubuntu:latest


# Creating the directory where all the information will be managed

RUN mkdir -p BDaaS/dependencies

# Link to the working directiry
WORKDIR /BDaaS/dependencies
ARG MINICONDA2_PACKAGE

# Copy the installer to and specific 

RUN apt-get -y update && apt-get install -y bzip2 git build-essential net-tools && rm -rf /var/lib/apt/lists/* 

RUN mkdir jre

COPY packages/jre ./jre/  
COPY packages/$MINICONDA2_PACKAGE ./ 

# Install JRE and Miniconda

RUN bash $MINICONDA2_PACKAGE -b -p /BDaaS/dependencies/miniconda && rm $MINICONDA2_PACKAGE 

ENV INSTALL_DIR=/BDaaS/dependencies
ENV JAVA_HOME="$INSTALL_DIR/jre" 
ENV PATH="$PATH:$JAVA_HOME/bin:$INSTALL_DIR/miniconda/bin"



RUN conda update conda && env > /etc/environment 

