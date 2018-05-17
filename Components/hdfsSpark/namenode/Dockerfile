# Parto de la imagen principal
FROM  python3:0_0_1
LABEL maintainer="Ronal Muresano"

WORKDIR /BDaaS/dependencies

COPY startup-name-node-config.sh ./
COPY packages/ ./

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils iputils-ping

CMD ["/bin/bash", "/BDaaS/dependencies/startup-name-node-config.sh"]
