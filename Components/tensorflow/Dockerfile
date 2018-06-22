# Parto de la imagen principal
FROM  python3:0_0_1
LABEL maintainer="Ronal Muresano"

WORKDIR /eslap/legacy

COPY startup-master-config.sh ./
COPY tf.py ./

RUN conda install -c numpy tensorflow

ENTRYPOINT ./startup-master-config.sh
