FROM node:8

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

RUN npm install -g yarn --update

RUN curl --insecure -OL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip && unzip sonar-scanner-cli-4.2.0.1873-linux.zip

RUN ls -la /sonar-scanner-4.2.0.1873-linux/bin

RUN echo "#!/bin/bash\n/sonar-scanner-4.2.0.1873-linux/bin/sonar-scanner" > /usr/bin/sonar-scanner && \
    chmod +x /usr/bin/sonar-scanner

CMD ["aws", "--version"]