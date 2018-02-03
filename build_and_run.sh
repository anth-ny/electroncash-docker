sudo docker build -t ec . && \

#	-v $HOME/.Xauthority:/$HOME/.Xauthority \
sudo docker run \
	--rm \
	-it \
	-v $HOME/.electron-cash/:/home/user/.electron-cash/ \
	-v $HOME/ec-backup/:/home/user/ec-backup/ \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY \
	--name ec \
	ec
