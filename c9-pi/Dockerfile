FROM armhf/debian:jessie
RUN apt-get update && apt-get -y dist-upgrade
RUN cd && apt-get -y install python-software-properties python make build-essential g++ curl libssl-dev apache2-utils git libxml2-dev bison binutils mercurial gcc nano wget nodejs npm nodejs-dev nodejs-legacy
RUN wget https://storage.googleapis.com/golang/go1.7.linux-armv6l.tar.gz -O /tmp/go.tgz && cd /usr/local/ && tar zxf /tmp/go.tgz && cp /usr/local/go/bin/* /usr/local/bin && rm /tmp/go.tgz
RUN mkdir /root/GitHub && cd /root/GitHub/ && git clone https://github.com/c9/core
RUN git config --global url."https://".insteadOf git://
RUN export NODE_PATH=”/usr/local/lib/node_modules” &&  npm install -g n --prefix=/usr/local && n stable && npm install -g npm --prefix=/usr/local/
RUN export NODE_PATH=”/usr/local/lib/node_modules” && export PATH=/usr/local/bin:$PATH && cd /root/GitHub/core/ && /usr/local/bin/npm install packages
RUN export NODE_PATH=”/usr/local/lib/node_modules” && export PATH=/usr/local/bin:$PATH && cd /root/GitHub/core/ && /usr/local/bin/npm install
RUN export NODE_PATH=”/usr/local/lib/node_modules” && export PATH=/usr/local/bin:$PATH && cd /root/GitHub/core && ./scripts/install-sdk.sh
#RUN mkdir /root/GitHub && cd /root/GitHub && git clone https://github.com/c9/core && cd core && npm install packager && npm install && ./scripts/install-sdk.sh
RUN GOPATH=/root/.c9/go  go get github.com/nsf/gocode
RUN mkdir /root/workspace
COPY start.sh /
RUN chmod 755 /start.sh
CMD /start.sh
