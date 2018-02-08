FOR TESTING PURPOSES ONLY

Everything is very much in flux right now. If you try to persist a volume between builds, your volume will probably be corrupted. Fortunately, docker greatly facilitates starting over from scratch, as long as you have a backup (facilitated backup creation not yet written).

First install x11docker (see https://github.com/mviereck/x11docker):

~~~~
wget https://raw.githubusercontent.com/mviereck/x11docker/master/x11docker -O /tmp/x11docker
bash /tmp/x11docker --update
rm /tmp/x11docker
~~~~

Also install xpra (possibly optional, but highly recommended):

~~~~
sudo dnf install xpra #if using fedora
~~~~

Then, run (see https://raw.githubusercontent.com/anth-ny/electroncash-docker/master/run.sh):

~~~~
x11docker -- "--mount src=electroncash,dst=/data" ajdjd/electroncash
~~~~

While Electron Cash is running in Docker, copy a wallet from your .electron-cash folder to Docker (optional):

~~~~
sudo docker cp ~/.electron-cash/wallets/default_wallet `sudo docker ps | grep x11docker | grep ajdjd_electroncash | awk -F " " '{print $NF}'`:/data/.electron-cash/wallets/
~~~~
