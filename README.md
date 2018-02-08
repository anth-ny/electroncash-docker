FOR TESTING PURPOSES ONLY

Everything is very much in flux right now. If you try to persist a volume between builds, your volume will probably be corrupted. Fortunately, docker greatly facilitates starting over from scratch, as long as you have a backup (facilitated backup creation not yet written).

https://raw.githubusercontent.com/anth-ny/electroncash-docker/master/run.sh

~~~~
sudo x11docker -- "--mount src=electroncash,dst=/data" ajdjd/electroncash
~~~~
