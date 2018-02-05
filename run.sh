if [ "$1" == "test" ]; then
  IMAGE="ec"
  shift
else
  IMAGE="ajdjd/electroncash"
fi
#	-v $HOME/.Xauthority:/$HOME/.Xauthority \
sudo docker run \
	--rm \
	$IT \
	-u `id -u $USER`:`id -g $USER` \
	--mount src=electroncash,dst=/data \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	--env DISPLAY \
	--init \
	--name ec \
	$IMAGE $*
