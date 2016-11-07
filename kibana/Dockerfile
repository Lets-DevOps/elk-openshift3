# Kibana Builder Image

FROM openshift/base-centos7

MAINTAINER Virendra Singh Bhalothia <bhalothia@theremotelab.com>

ENV KIBANA_VERSION=4.6.1 \
    JAVA_VERSION=1.8.0 \
    KIBANA_HOME=/usr/share/kibana \
    ELASTICSEARCH_URL=http://elasticsearch:9200


LABEL io.k8s.description="Kibana" \
      io.k8s.display-name="Kibana ${KIBANA_VERSION}" \
      io.openshift.expose-services="5601:http" \
      io.openshift.tags="Kibana, ${KIBANA_VERSION}, elk"

RUN \
  rpm --rebuilddb && yum clean all && \
  yum install -y tar java-${JAVA_VERSION}-openjdk && \
  yum clean all && \
  mkdir -p ${KIBANA_HOME} && \
  cd ${KIBANA_HOME} && \
  curl -o /tmp/kibana4.tgz https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz && \
  tar zxvf /tmp/kibana4.tgz -C ${KIBANA_HOME} --strip-components=1 && \
  rm -f /tmp/kibana4.tgz

ENV KIBANA_CONFIG=${KIBANA_HOME}/config/kibana.yml \
    PATH=${KIBANA_HOME}/bin:${KIBANA_HOME}/bin:$PATH


EXPOSE 5601

# Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./.s2i/bin/ /usr/libexec/s2i

COPY ./test/bin/bootstrap.sh ${KIBANA_HOME}/bin/bootstrap.sh

RUN chown -R 1001:1001 ${KIBANA_HOME}

# This default user is created in the openshift/base-centos7 image
USER 1001

WORKDIR ${KIBANA_HOME}

CMD ["/usr/libexec/s2i/usage"]
