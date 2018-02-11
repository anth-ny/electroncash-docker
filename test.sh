if [ "$1" == "dev" ]; then
  shift
  IMG=ecdev
elif [ "$1" == "latest" ]; then
  shift
  IMG=ec
else
  echo "dev or latest?"
  exit
fi
x11docker -- "--mount src=electroncash,dst=/data" $IMG $*
#sudo docker run -u 1000:1000 --volume /tmp/.X11-unix:/tmp/.X11-unix --env DISPLAY -it --rm --mount src=electroncash,dst=/data $IMG $*
