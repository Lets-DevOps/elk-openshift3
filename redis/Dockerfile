
# redis
FROM openshift/base-centos7

MAINTAINER Harish Shetty <harish@theremotelab.com>

ENV BUILDER_VERSION=1.0 \
	HOME=/opt/app-root/src \
	REDIS_VERSION=3.2.5

LABEL io.k8s.description="Builder platform for Redis" \
     io.k8s.display-name="redis ${REDIS_VERSION}" \
     io.openshift.expose-services="6379:http" \
     io.openshift.tags="redis,${REDIS_VERSION},elk,database,cache,mq"

RUN cd /tmp && \
	wget -q http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz && \
	tar xzf redis-${REDIS_VERSION}.tar.gz && \
	cd redis-${REDIS_VERSION} && \
	make && \
	make install && \
	cp redis.conf $HOME/ && \
	rm -rf /tmp/redis* && \
	sed -ri 's!^(bind 127.0.0.1)$!# \1!' $HOME/redis.conf && \
	cd $HOME

COPY ./.s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:1001 /opt/app-root

USER 1001

EXPOSE 6379

CMD ["/usr/libexec/s2i/usage"]
