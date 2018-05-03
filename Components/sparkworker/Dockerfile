# Parto de la imagen principal
FROM  python3:0_0_1
LABEL maintainer="Ronal Muresano"

WORKDIR /BDaaS/dependencies

COPY startup-worker-config.sh ./
COPY packages/ ./

RUN apt-get update && apt-get install -y iputils-ping


CMD ["/BDaaS/dependencies/startup-worker-config.sh"]