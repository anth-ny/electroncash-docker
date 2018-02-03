FROM ubuntu:16.04 as tarball

RUN apt-get update

COPY jonaldkey2.txt ElectronCash-3.1.2.tar.gz.sig /tmp/

RUN apt-get install -y --no-install-recommends curl ca-certificates
RUN curl -o /tmp/ElectronCash-3.1.2.tar.gz https://electroncash.org/downloads/3.1.2/win-linux/ElectronCash-3.1.2.tar.gz

RUN gpg --import /tmp/jonaldkey2.txt
RUN gpg --verify /tmp/ElectronCash-3.1.2.tar.gz.sig /tmp/ElectronCash-3.1.2.tar.gz

FROM ubuntu:16.04 as binary

RUN apt-get update
RUN apt-get -y install python3-pyqt5

COPY --from=tarball /tmp/ElectronCash-3.1.2.tar.gz /tmp/

RUN apt-get install -y --no-install-recommends python3-pip python3-setuptools

RUN pip3 install --upgrade pip
RUN pip3 install /tmp/ElectronCash-3.1.2.tar.gz

#RUN pip3 show -f Electron-Cash pyaes ecdsa pbkdf2 certifi chardet idna urllib3 requests six qrcode protobuf dnspython jsonrpclib-pelix PySocks sip pyqt5
#RUN ls -l /usr/local/bin
#/usr/local/share/man/man1/qr.1
#/usr/share/applications/electron-cash.desktop
#/usr/share/pixmaps/electron-cash.png

FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y --no-install-recommends install python3-pyqt5

COPY --from=binary /usr/local/bin/chardetect /usr/local/bin/electron-cash /usr/local/bin/pylupdate5 /usr/local/bin/pyrcc5 /usr/local/bin/pyuic5 /usr/local/bin/qr /usr/local/lib/python3.5/dist-packages /usr/local/bin/

RUN groupadd -g 1000 -r user && useradd -u 1000 --create-home --no-log-init -r -g user user
USER user
RUN mkdir /tmp/runtime-user && chmod 700 /tmp/runtime-user
COPY electron-cash.sh /home/user/
CMD ["/home/user/electron-cash.sh"]
