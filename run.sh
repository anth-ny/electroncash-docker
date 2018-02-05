if [ "$1" == "test" ]; then
  IMAGE="ec"
  shift
else
  IMAGE="ajdjd/electroncash"
fi
if [ "$*" == "" ]; then
  IT="--detach"
fi
if [ "$*" == "sleep infinity" ]; then
  IT="--detach"
fi
if [ "$*" == "/bin/bash" ]; then
  IT="--interactive --tty"
fi
if [ "$*" == "root shell" ]; then
  IT="--interactive --tty"
fi
#	-v $HOME/.Xauthority:/$HOME/.Xauthority \
sudo docker run \
	--rm \
	$IT \
	-e UID=`id -u $USER` -e GID=`id -g $USER` \
	--mount src=electroncash,dst=/data \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	--env DISPLAY \
	--init \
	--name ec \
	$IMAGE $*
