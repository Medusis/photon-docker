FROM stackbrew/ubuntu:saucy
MAINTAINER EB <medusis+photon@gmail.com>

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget git default-jdk maven

RUN git clone https://github.com/komoot/photon.git /photon

WORKDIR /photon
RUN mvn clean package
RUN java -jar target/photon-0.1-SNAPSHOT.jar -import-snapshot http://photon.komoot.de/data/world.zip
RUN java -jar target/photon-0.1-SNAPSHOT.jar
