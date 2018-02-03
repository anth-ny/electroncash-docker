mkdir -p $HOME/.electron-cash
mkdir -p $HOME/ec-backup
#	-v $HOME/.Xauthority:/$HOME/.Xauthority \
if [ "$1" == "test" ]; then
  IMAGE="ec"
  shift
else
  IMAGE="ajdjd/electroncash"
fi
if [ "$*" == "" ]; then
  IT="--detach"
fi
if [ "$*" == "sleep" ]; then
  IT="--detach"
fi
if [ "$*" == "shell" ]; then
  IT="--interactive --tty"
fi
if [ "$*" == "root shell" ]; then
  IT="--interactive --tty"
fi
sudo docker run \
	--rm \
	$IT \
	--volume $HOME/.electron-cash/:/data/.electron-cash/ \
	--volume $HOME/ec-backup/:/data/ec-backup/ \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	--env DISPLAY \
	--init \
	--name ec \
	$IMAGE $*
