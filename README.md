https://raw.githubusercontent.com/anth-ny/electroncash-docker/master/run.sh

mkdir -p $HOME/.electron-cash
mkdir -p $HOME/ec-backup

sudo docker run \
--rm \
--volume $HOME/.electron-cash/:/data/.electron-cash/ \
--volume $HOME/ec-backup/:/data/ec-backup/ \
--volume /tmp/.X11-unix:/tmp/.X11-unix \
--env DISPLAY \
--init \
--name ec \
ajdjd/electroncash
