# Parto de la imagen principal
FROM  python3:0_0_1
LABEL maintainer="Radiatus Team"

WORKDIR /eslap/legacy

COPY startup-master-config.sh ./
COPY packages/ ./

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils iputils-ping

ENTRYPOINT ./startup-master-config.sh
