FROM ubuntu

MAINTAINER Sergiy Tupchiy <stupchiy@gmail.com>

# Install dependencies required for link-checker distribution installation
RUN apt-get update && apt-get install -y \
      cpanminus \
      make \
      build-essential \
      libssl-dev \
      curl \
      zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

ENV CHECKLINK_VERSION 4_81

ARG CHECKLINK_URL=https://github.com/w3c/link-checker/archive/checklink-${CHECKLINK_VERSION}.tar.gz

RUN set -x \
  && curl -sSL ${CHECKLINK_URL} -o /tmp/link-checker.tar.gz \
  && mkdir -p /usr/src \
  && tar -xzf /tmp/link-checker.tar.gz -C /usr/src \
  && rm /tmp/link-checker.tar.gz \
  && cd /usr/src/link-checker-checklink-${CHECKLINK_VERSION} \
  && cpanm --installdeps . \
  && cpanm LWP::Protocol::https \
  && perl Makefile.PL \
  && make \
  && make test \
  && make install \
  && rm -rf /usr/src/link-checker-checklink-${CHECKLINK_VERSION}

ENTRYPOINT ["/usr/local/bin/checklink"]
CMD ["-h"]
