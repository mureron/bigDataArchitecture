# Parto de la imagen principal
FROM  python2:0_0_1
LABEL maintainer="Ronal Muresano"

WORKDIR /eslap/legacy

COPY startup-master-config.sh ./
COPY packages/ ./

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils iputils-ping

RUN pip install dist-keras

ENTRYPOINT ./startup-master-config.sh
