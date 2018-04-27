RUNTIME_IMAGE="eslap.cloud/runtime/native:1_0_1"


############################################
#  Paquetes de codigo fuente:

JAVA_PACKAGE="server-jre-8u131-linux-x64.tar.gz"
JAVA_URL="http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/$JAVA_PACKAGE"

ZOOKEEPER_PACKAGE="zookeeper-3.4.10.tar.gz"
ZOOKEEPER_URL="http://apache.rediris.es/zookeeper/stable/$ZOOKEEPER_PACKAGE"

HADOOP_PACKAGE="hadoop-2.7.6.tar.gz"
HADOOP_URL="http://archive.cloudera.com/cdh5/cdh/5/$HADOOP_CDH_PACKAGE"

SPARK_CDH_PACKAGE="spark-1.6.0-cdh5.10.0.tar.gz"
SPARK_CDH_URL="http://archive.cloudera.com/cdh5/cdh/5/$SPARK_CDH_PACKAGE"

SPARK_PACKAGE="spark-2.3.0-bin-without-hadoop.tgz"
SPARK_URL="https://d3kbcqa49mib13.cloudfront.net/$SPARK_PACKAGE"

CASSANDRA_PACKAGE="apache-cassandra-3.11.0-bin.tar.gz"
CASSANDRA_URL="http://apache.rediris.es/cassandra/3.11.0/$CASSANDRA_PACKAGE"

SCALA_PACKAGE="scala-2.10.5.tgz"
SCALA_URL="https://downloads.lightbend.com/scala/2.10.5/$SCALA_PACKAGE"

APACHE_TOMCAT_PACKAGE="apache-tomcat-9.0.0.M26.tar.gz"
APACHE_TOMCAT_URL="http://apache.uvigo.es/tomcat/tomcat-9/v9.0.0.M26/bin/$APACHE_TOMCAT_PACKAGE"

FIREFOX_PACKAGE="firefox-54.0.tar.bz2"
FIREFOX_URL="https://ftp.mozilla.org/pub/firefox/releases/54.0/linux-x86_64/es-ES/$FIREFOX_PACKAGE"

GECKODRIVER_PACKAGE="geckodriver-v0.18.0-linux64.tar.gz"
GECKODRIVER_URL="https://github.com/mozilla/geckodriver/releases/download/v0.18.0/$GECKODRIVER_PACKAGE"

JENKINS_PACKAGE="jenkins.war"
JENKINS_URL="http://mirrors.jenkins.io/war-stable/latest/$JENKINS_PACKAGE"

ELASTICSEARCH_PACKAGE="elasticsearch-5.5.2.tar.gz"
ELASTICSEARCH_URL="https://artifacts.elastic.co/downloads/elasticsearch/$ELASTICSEARCH_PACKAGE"

LOGSTASH_PACKAGE="logstash-5.5.2.tar.gz"
LOGSTASH_URL="https://artifacts.elastic.co/downloads/logstash/$LOGSTASH_PACKAGE"

KIBANA_PACKAGE="kibana-5.5.2-linux-x86_64.tar.gz"
KIBANA_URL="https://artifacts.elastic.co/downloads/kibana/$KIBANA_PACKAGE"

FILEBEAT_PACKAGE="filebeat-5.5.2-linux-x86_64.tar.gz"
FILEBEAT_URL="https://artifacts.elastic.co/downloads/beats/filebeat/$FILEBEAT_PACKAGE"

SHELLINABOX_PACKAGE="shellinabox.tar.gz"
SHELLINABOX_ZIP="source-archive.zip"
SHELLINABOX_URL="https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/shellinabox/$SHELLINABOX_ZIP"

FLINK_PACKAGE="flink.tar.gz"
FLINK_URL="http://apache.rediris.es/flink/flink-1.4.0/$FLINK_PACKAGE"

#ZEPPELIN_PACKAGE="zeppelin-0.7.3-bin-all.tgz"
ZEPPELIN_PACKAGE="zeppelin-0.7.3.tar.gz"
ZEPPELIN_URL="https://dbox.iti.upv.es/oc/index.php/s/r6d6OtTydZ8Cbj9/download"

ZEPPELIN_SPARK_PACKAGE="zeppelin-0.7.3-spark-2.1.1-hadoop-2.7.3-scala-2.11.tar.gz"
ZEPPELIN_SPARK_URL="https://dbox.iti.upv.es/oc/index.php/s/lDByS4PfI30LpJY/download"

ZEPPELIN_PACKAGE_A="zeppelin-0.7.3-A.tar.gz"

ZEPPELIN_PACKAGE_B="zeppelin-0.7.3-B.tar.gz"

KAFKA_PACKAGE="kafka_2.11-0.11.0.1.tgz"
KAFKA_URL="http://apache.uvigo.es/kafka/0.11.0.1/$KAFKA_PACKAGE"
KAFKA_MANAGER_PACKAGE="kafka-manager-1.3.3.14.tar.gz"

KAFKA_REST_PROXY_PACKAGE="kafka-rest-4.0.0.tar.gz"
KAFKA_REST_PROXY_URL="https://github.com/confluentinc/kafka-rest/archive/v4.0.0.tar.gz"

############################################
#  Installers:

MINICONDA2_PACKAGE="Miniconda2-latest-Linux-x86_64.sh"
MINICONDA2_URL="https://repo.continuum.io/miniconda/$MINICONDA2_PACKAGE"

MINICONDA3_PACKAGE="Miniconda3-latest-Linux-x86_64.sh"
MINICONDA3_URL="https://repo.continuum.io/miniconda/$MINICONDA3_PACKAGE"

############################################
#  Dependencias Java:

SPARK_CASSANDRA_CONNECTOR_JAR="spark-cassandra-connector-2.0.3-s_2.11.jar"
SPARK_CASSANDRA_CONNECTOR_URL="http://dl.bintray.com/spark-packages/maven/datastax/spark-cassandra-connector/2.0.3-s_2.11/$SPARK_CASSANDRA_CONNECTOR_JAR"
SPARK_CASSANDRA_CONNECTOR_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/P84KARnRQSzyqQK/download"

#JUNIT
JUNIT_JAR="junit-4.12.jar"
JUNIT_URL="https://repo1.maven.org/maven2/junit/junit/4.12/$JUNIT_JAR"

#SELENIUM
SELENIUM_JAR="selenium-server-standalone-3.4.0.jar"
SELENIUM_URL="http://selenium-release.storage.googleapis.com/3.4/$SELENIUM_JAR"

#SELENIUM HTML RUNNER
SELENIUM_HTML_RUNNER_JAR="selenium-html-runner-3.5.3.jar"
SELENIUM_HTML_RUNNER_URL="https://selenium-release.storage.googleapis.com/3.5/$SELENIUM_HTML_RUNNER_JAR"

# Spark Streaming Kafka integration
SPARK_STREAMING_KAFKA_JAR="spark-streaming-kafka-0-8-assembly_2.11-2.1.1.jar"
SPARK_STREAMING_KAFKA_URL="http://search.maven.org/remotecontent?filepath=org/apache/spark/spark-streaming-kafka-0-8-assembly_2.11/2.1.1/$SPARK_STREAMING_KAFKA_JAR"
SPARK_STREAMING_KAFKA_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/cMDV09VFUYWRquW/download"

HADOOP_COMMON_JAR="hadoop-common-0.22.0.jar"
HADOOP_COMMON_URL="http://search.maven.org/remotecontent?filepath=org/apache/hadoop/hadoop-common/0.22.0/$HADOOP_COMMON_JAR"

HADOOP_MAPRED_JAR="hadoop-mapred-0.22.0.jar"
HADOOP_MAPRED_URL="http://search.maven.org/remotecontent?filepath=org/apache/hadoop/hadoop-mapred/0.22.0/$HADOOP_MAPRED_JAR"

# Jar necessary to insert data from Spark to Cassandra
JSR166E_JAR="jsr166e-1.1.0.jar"
JSR166E_URL="http://central.maven.org/maven2/com/twitter/jsr166e/1.1.0/$JSR166E_JAR"
JSR166E_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/dILBrVAJ0bjRAvz/download"

############################################
#  Dependencias Python:

# SCIPY
SCIPY_PACKAGE="scipy-0.19.1-cp27-cp27mu-manylinux1_x86_64.whl"
SCIPY_URL="https://pypi.python.org/packages/8e/43/a7b400e7ea07220fb419f0669ff17f5ef71653cf32827315224bc9dda9d4/$SCIPY_PACKAGE"
SCIPY_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/8ZPWcM511Yrqc95/download"

# SIX
SIX_PACKAGE="six-1.10.0.tar.gz"
SIX_URL="https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/$SIX_PACKAGE"
SIX_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/vs6lGiP3Crk8u8a/download"

# FUTURES
FUTURES_PACKAGE="futures-3.1.1.tar.gz"
FUTURES_URL="https://pypi.python.org/packages/cc/26/b61e3a4eb50653e8a7339d84eeaa46d1e93b92951978873c220ae64d0733/$FUTURES_PACKAGE"
FUTURES_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/2IDlKKH66Symly3/download"

# Cassandra driver para python. Dependencias: [SIX, FUTURES]
CASSANDRA_DRIVER_PACKAGE="cassandra-driver-3.12.0.tar.gz"
CASSANDRA_DRIVER_URL="https://dbox.iti.upv.es/oc/index.php/s/NVUIGcEYHhKGCMI/download"
CASSANDRA_DRIVER_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/NVUIGcEYHhKGCMI/download"

# Jupyter
JUPYTER_PACKAGE="jupyter-1.0.0.tar.gz"
JUPYTER_URL="https://pypi.python.org/packages/c9/a9/371d0b8fe37dd231cf4b2cff0a9f0f25e98f3a73c3771742444be27f2944/$JUPYTER_PACKAGE"
JUPYTER_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/oA16W7ERU8Bxbv1/download"

# Pandas. Dependencias: [Numpy, SIX, Pytz, Python_dateutil]
PANDAS_PACKAGE="pandas-0.20.3-cp27-cp27mu-manylinux1_x86_64.whl"
PANDAS_URL="https://pypi.python.org/packages/77/61/222973b3373d127386124ce715dc9680111b74f2255d13384fcc4a6ff463/$PANDAS_PACKAGE"
PANDAS_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/v19BFUEtW6zz6Ho/download"

# Kafka Python
KAFKA_PYTHON_PACKAGE="kafka_python-1.3.5-py2.py3-none-any.whl"
KAFKA_PYTHON_URL="https://pypi.python.org/packages/45/05/ad449f64ce4cbcfae86d908d1af98a86116011ddee81d5d76d49e48604d3/$KAFKA_PYTHON_PACKAGE"
KAFKA_PYTHON_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/weaf0JOtYHleBeh/download"

# MySQL
MYSQL_DEBS_PACKAGE="mysql-server_5.7.20-1ubuntu14.04_amd64.deb-bundle.tar"
MYSQL_DEBS_PACKAGE_URL="https://dev.mysql.com/get/Downloads/MySQL-5.7/$MYSQL_DEBS_PACKAGE"

# Apache Toree (Jupyter Kernel that supports Python, Scala and R in Spark)

TOREE_PACKAGE="toree-0.2.0.dev1.tar.gz"
TOREE_REPO_URL="https://dbox.iti.upv.es/oc/index.php/s/4HyWwhiMNvhfTfs/download"

#BZIP2 
BZIP2_PACKAGE="bzip2-1.0.6.tar.gz"
BZIP2_REPO_URL="http://www.bzip.org/1.0.6/"

