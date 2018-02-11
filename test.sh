if [ "$1" == "dev" ]; then
  shift
  x11docker -- "--mount src=electroncash,dst=/data" ecdev $*
elif [ "$1" == "latest" ]; then
  shift
  x11docker -- "--mount src=electroncash,dst=/data" ec $*
else
  echo "dev or latest?"
  exit
fi
