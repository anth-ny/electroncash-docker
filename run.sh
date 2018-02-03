mkdir -p $HOME/.electron-cash
mkdir -p $HOME/ec-backup
#	-v $HOME/.Xauthority:/$HOME/.Xauthority \
sudo docker run \
	--rm \
	-it \
	-v $HOME/.electron-cash/:/data/.electron-cash/ \
	-v $HOME/ec-backup/:/data/ec-backup/ \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY \
	--init \
	--name ec \
	ajdjd/electroncash
