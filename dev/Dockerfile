FROM ubuntu:17.10 as fyookball

COPY --from=ajdjd/electroncash:shared /tmp/maybe-apt-get-update.sh /tmp/
RUN /tmp/maybe-apt-get-update.sh
RUN /tmp/maybe-apt-get-update.sh && apt-get install -y git
#RUN apt-get install -y patch

USER 1000

RUN true \
	&& cd /tmp \
	&& git clone git://github.com/fyookball/electrum.git \
	;

#COPY snapcraft.yaml.patch /tmp/electrum/snap/

#RUN true \
#	&& cd /tmp/electrum/snap/ \
#	&& patch <snapcraft.yaml.patch \
#	&& rm snapcraft.yaml.patch \
#	;

FROM ubuntu:17.10

COPY --from=ajdjd/electroncash:shared /tmp/maybe-apt-get-update.sh /tmp/
RUN /tmp/maybe-apt-get-update.sh

RUN /tmp/maybe-apt-get-update.sh && \
	apt-get install -y \
		protobuf-compiler \
		python3-pyqt5 \
		python3-pip \
	;

RUN pip3 install pyqt5

COPY --from=fyookball /tmp/electrum /tmp/electrum
COPY --from=ajdjd/docker-machine-id-setup /tmp/docker-machine-id-setup /usr/local/bin/

RUN true \
	&& cd /tmp/electrum \
	&& pyrcc5 icons.qrc -o gui/qt/icons_rc.py \
	&& protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto \
	&& python3 setup.py install \
	;

RUN true \
  && mkdir /data \
  && chmod 1777 /data \
  && chmod 4755 /usr/local/bin/docker-machine-id-setup \
  && ln -s /data/.electron-cash / \
;

COPY --from=ajdjd/electroncash:shared /entrypoint.sh /electron-cash.sh /

VOLUME /data
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/electron-cash.sh"]
