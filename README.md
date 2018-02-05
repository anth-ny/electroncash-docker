FOR TESTING PURPOSES ONLY

Everything is very much in flux right now. If you try to persist a volume between builds, your volume will probably be corrupted. Fortunately, docker greatly facilitates starting over from scratch, as long as you have a backup (facilitated backup creation not yet written).

https://raw.githubusercontent.com/anth-ny/electroncash-docker/master/run.sh

~~~~
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
~~~~
