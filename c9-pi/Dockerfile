FROM debian:jessie
RUN apt-get update && apt-get -y dist-upgrade
RUN cd && apt-get -y install python-software-properties python make build-essential g++ curl libssl-dev apache2-utils git libxml2-dev bison binutils mercurial gcc nano wget nodejs npm nodejs-dev nodejs-legacy default-jdk default-jre libpcap-dev mingw-w64 mingw-w64-i686-dev mingw-w64-x86-64-dev
RUN mkdir /root/GitHub && cd /root/GitHub/ && git clone https://github.com/c9/core
RUN git config --global url."https://".insteadOf git://
RUN export NODE_PATH=”/usr/local/lib/node_modules” &&  npm install -g n --prefix=/usr/local && n stable && npm install -g npm@4.5.0 --prefix=/usr/local/
RUN export NODE_PATH=”/usr/local/lib/node_modules” && export PATH=/usr/local/bin:$PATH && cd /root/GitHub/core/ && /usr/local/bin/npm install packages
RUN export NODE_PATH=”/usr/local/lib/node_modules” && export PATH=/usr/local/bin:$PATH && cd /root/GitHub/core/ && /usr/local/bin/npm install
RUN export NODE_PATH=”/usr/local/lib/node_modules” && export PATH=/usr/local/bin:$PATH && cd /root/GitHub/core && ./scripts/install-sdk.sh
RUN wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz -O /tmp/go.tgz && cd /usr/local/ && tar zxf /tmp/go.tgz && cp /usr/local/go/bin/* /usr/local/bin && rm /tmp/go.tgz
RUN GOPATH=/root/.c9/go  go get github.com/nsf/gocode
RUN mkdir /root/workspace
COPY start.sh /
COPY bashrc /root/.bashrc
RUN chmod 755 /start.sh
CMD /start.sh
