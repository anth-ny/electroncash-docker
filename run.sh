if [ "$1" == "test" ]; then
  IMAGE="ec"
  shift
elif [ "$1" == "prod" ]; then
  IMAGE="electroncash"
  shift
elif [ "$1" == "hub" ]; then
  IMAGE="ajdjd/electroncash"
  shift
else
  echo "test, prod, or hub?"
  exit
fi
sudo x11docker -- "--mount src=electroncash,dst=/data" $IMAGE $*
