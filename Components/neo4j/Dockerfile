# Parto de la imagen principal
FROM  python3:0_0_1

WORKDIR /eslap/legacy

RUN /bin/mkdir -p volumen/data

COPY startup-neo4j.sh ./
COPY packages/ ./
COPY csv/ ./

ENTRYPOINT ./startup-neo4j.sh
