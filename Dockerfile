# vim:set ft=dockerfile:
FROM postgres:11


RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install postgresql-11-pljava
RUN echo "#Pl/Java Parameters" >> /var/lib/postgresql/data/postgresql.conf
RUN echo "pljava.classpath = \'/usr/share/postgresql/11/pljava/pljava-1.5.5.jar\'"  >> /var/lib/postgresql/data/postgresql.conf
RUN echo "pljava.libjvm_location = \'/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/libjvm.so\'" >> /var/lib/postgresql/data/postgresql.conf

ADD /docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
