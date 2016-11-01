
# elasticsearch
FROM openshift/base-centos7

MAINTAINER Harish Shetty <harish@theremotelab.com>

ENV BUILDER_VERSION=1.0 \
	HOME=/opt/app-root/src \
	JAVA_VERSION=1.8.0 \
	ES_VERSION=2.4.1 \
	ES_HOME=/usr/share/elasticsearch \
	ELASTICSEARCH_CLUSTER_NAME=elasticsearch-cluster \
	ELASTICSEARCH_MAX_MEMORY=1G \
	ELASTICSEARCH_LOG_LEVEL=INFO

LABEL io.k8s.description="Builder platform for Elasticsearch" \
     io.k8s.display-name="Elasticsearch ${ES_VERSION}" \
     io.openshift.expose-services="9200:http, 9300:http" \
     io.openshift.tags="elasticsearch,${ES_VERSION},elk,database,cache,search"

RUN yum install -y --setopt=tsflags=nodocs java-${JAVA_VERSION}-openjdk && \
	wget -q https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/${ES_VERSION}/elasticsearch-${ES_VERSION}.tar.gz && \
	mkdir -p ${ES_HOME} && tar -zxvf elasticsearch-${ES_VERSION}.tar.gz -C ${ES_HOME} --strip-components=1 && \
	rm -f elasticsearch-${ES_VERSION}.tar.gz && \
	yum clean all -y && \
	chown -R 1001:0 ${ES_HOME}

COPY ./.s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:1001 /opt/app-root

USER 1001

EXPOSE 9200
EXPOSE 9300

CMD ["/usr/libexec/s2i/usage"]
