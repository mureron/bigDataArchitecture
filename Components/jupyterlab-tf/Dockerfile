# Parto de la imagen principal
FROM  jupyterlab:0_0_1
LABEL maintainer="Radiatus Team"

copy data/ /eslap/legacy/
RUN conda install -c numpy pandas scipy scikit-learn tensorflow keras
