# Parto de la imagen principal
FROM  python3:0_0_1
LABEL maintainer="Ronal Muresano"

WORKDIR /BDaaS/dependencies

COPY startup-master-config.sh ./
COPY packages/ ./

RUn apt-get update && apt-get install -y iputils-ping

CMD ["/BDaaS/dependencies/startup-master-config.sh"]
