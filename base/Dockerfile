FROM ubuntu:17.10

COPY maybe-apt-get-update.sh /tmp/
RUN /tmp/maybe-apt-get-update.sh

RUN /tmp/maybe-apt-get-update.sh && apt-get -y install python3-pyqt5

COPY --from=ajdjd/docker-machine-id-setup /tmp/docker-machine-id-setup /usr/local/bin/
RUN chmod 4755 /usr/local/bin/docker-machine-id-setup

RUN true \
  && mkdir /data \
  && chmod 1777 /data \
  && ln -s /data/.electron-cash / \
;

COPY entrypoint.sh electron-cash.sh /
