FROM ubuntu:17.10 as fyookball

COPY --from=ajdjd/electroncash:base /tmp/maybe-apt-get-update.sh /tmp/
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

FROM ajdjd/electroncash:base

RUN /tmp/maybe-apt-get-update.sh && \
	apt-get install -y \
		protobuf-compiler \
		python3-pip \
	;

RUN pip3 install pyqt5

COPY --from=fyookball /tmp/electrum /tmp/electrum

RUN true \
	&& cd /tmp/electrum \
	&& pyrcc5 icons.qrc -o gui/qt/icons_rc.py \
	&& protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto \
	&& python3 setup.py install \
	;

VOLUME /data
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/electron-cash.sh"]
