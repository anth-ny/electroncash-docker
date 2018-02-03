sudo docker build -t ec . && \
#sudo docker run --name ec --rm -it -u user -v /home/user/.electron-cash/:/home/user/.electron-cash/ -p 127.0.0.1:10000:10000 ec xpra start :100 --compressors=lz4 --start-child=/usr/local/bin/electron-cash --bind-tcp=0.0.0.0:10000 --no-daemon --no-mdns --no-notifications --no-pulseaudio --exit-with-children

#	-v $HOME/.Xauthority:/$HOME/.Xauthority \
sudo docker run \
	--rm \
	-it \
	-v /home/user/.electron-cash/:/home/user/.electron-cash/ \
	-v /home/user/ec-backup/:/home/user/ec-backup/ \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY \
	--name ec \
	ec
