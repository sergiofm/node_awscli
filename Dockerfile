FROM node:12

RUN \
  apt-get update \
  && apt-get install -y --no-install-recommends \
  ssh \
  wget \
  git \
  vim \
  wget \
  zlib1g-dev \
  jq \
  build-essential \
  iptables \
  libapparmor1 \
  libltdl7 \
  libmcrypt-dev \
  libxml2-dev \
  zip \
  unzip \
  python \
  python-dev \
  python-pip \
  python-yaml \
  python-setuptools \
  && apt-get clean

RUN pip install awscli --upgrade

RUN curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip && unzip sonar-scanner-cli-4.2.0.1873-linux.zip

RUN echo "#!/bin/bash\n/sonar-scanner-4.2.0.1873-linux/bin/sonar-scanner" > /usr/bin/sonar-scanner && \
    chmod +x /usr/bin/sonar-scanner

RUN apt-get install gnupg
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.2 main" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org

CMD ["aws", "--version"]