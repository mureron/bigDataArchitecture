# Parto de la imagen principal
FROM  python3:0_0_1

WORKDIR /eslap/legacy

COPY startup-worker-config.sh ./
COPY packages/ ./

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils iputils-ping

ENTRYPOINT ./startup-worker-config.sh
