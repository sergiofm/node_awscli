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
  redis-server \
  && apt-get clean

RUN python -v
RUN pip -v

RUN pip install awscli --upgrade

RUN npm install -g yarn --update

CMD ["aws", "--version"]