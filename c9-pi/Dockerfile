FROM armhf/debian:jessie
RUN apt-get update && apt-get -y dist-upgrade

RUN cd && apt-get -y install python-software-properties python make build-essential g++ curl libssl-dev apache2-utils git libxml2-dev bison binutils mercurial gcc nano wget
RUN wget https://storage.googleapis.com/golang/go1.6.2.linux-armv6l.tar.gz -O /tmp/go.tgz && cd /usr/local/ && tar zxf /tmp/go.tgz && cp /usr/local/go/bin/* /usr/local/bin && rm /tmp/go.tgz
RUN apt-get -y install nodejs npm nodejs-dev nodejs-legacy
RUN mkdir /root/GitHub && cd /root/GitHub
RUN cd /root/GitHub/ && git clone https://github.com/c9/core

RUN cd /root/GitHub/core/ && npm install packager
RUN cd /root/GitHub/core/ && npm install
RUN cd /root/GitHub/core && ./scripts/install-sdk.sh
RUN GOPATH=/root/.c9/go  go get github.com/nsf/gocode

COPY start.sh /
CMD /start.sh
