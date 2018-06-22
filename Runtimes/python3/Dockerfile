FROM eslap.cloud/runtime/native:2_0_0

# Creating the directory where all the information will be managed
LABEL maintainer="Radiatus Team"

# Link to the working directiry
WORKDIR /eslap/legacy
ARG MINICONDA3_PACKAGE

# Copy the installer to and specific 

RUN apt-get -y update &&  \
    apt-get install -y bzip2 git build-essential net-tools && \
    rm -rf /var/lib/apt/lists/* && \ 
    mkdir jre

COPY packages/jre ./jre/  
COPY packages/$MINICONDA3_PACKAGE ./ 

# Install JRE and Miniconda

RUN bash $MINICONDA3_PACKAGE -b -p /eslap/legacy/miniconda && rm $MINICONDA3_PACKAGE
RUN apt-get -y update && apt-get -y install ant gcc g++ libkrb5-dev libffi-dev libmysqlclient-dev libssl-dev libsasl2-dev libsasl2-modules-gssapi-mit libsqlite3-dev libtidy-0.99-0 libxml2-dev libxslt-dev make libldap2-dev maven libgmp3-dev

ENV INSTALL_DIR=/eslap/legacy
ENV JAVA_HOME="$INSTALL_DIR/jre" 
ENV PATH="$PATH:$JAVA_HOME/bin:$INSTALL_DIR/miniconda/bin"

RUN conda update conda && env > /etc/environment 

