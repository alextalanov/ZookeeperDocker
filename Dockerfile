FROM dockeralexandrtalan/java11

ARG HOME=/usr/local/lib
ARG ZOOKEEPER_ARHIVE=apache-zookeeper-3.5.6-bin.tar.gz

WORKDIR $HOME

RUN apt install -y  python3
RUN wget --no-check-certificate https://www.dropbox.com/s/85dcilgqyf853aq/apache-zookeeper-3.5.6-bin.tar.gz?dl=0 -O $ZOOKEEPER_ARHIVE
RUN tar -xvzf $ZOOKEEPER_ARHIVE
RUN rm -f $ZOOKEEPER_ARHIVE

ENV ZOOKEEPER_HOME=$HOME/apache-zookeeper-3.5.6-bin
ENV PATH=$PATH:$ZOOKEEPER_HOME/bin
ENV ZOOKEEPER_CONFIG=$ZOOKEEPER_HOME/conf

CMD ["zkServer.sh"]
