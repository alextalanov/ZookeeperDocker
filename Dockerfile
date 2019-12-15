FROM dockeralexandrtalan/java11

ARG HOME=/usr/local/lib
ARG APP=/usr/local/bin
ARG ZOO_ARHIVE=apache-zookeeper-3.5.6-bin.tar.gz

WORKDIR $HOME

RUN apt install -y  python3
RUN wget --no-check-certificate https://www.dropbox.com/s/85dcilgqyf853aq/apache-zookeeper-3.5.6-bin.tar.gz?dl=0 -O $ZOO_ARHIVE
RUN tar -xvzf $ZOO_ARHIVE
RUN rm -f $ZOO_ARHIVE

ENV ZOO_HOME=$HOME/apache-zookeeper-3.5.6-bin
ENV PATH=$PATH:$ZOO_HOME/bin
ENV ZOO_CONFIG=$ZOO_HOME/conf

COPY ./run-zookeeper.sh $APP

RUN chmod 777 $APP/run-zookeeper.sh

CMD ["/bin/bash", "run-zookeeper.sh"]