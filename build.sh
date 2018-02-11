cd shared
#cd docker-machine-id-setup && sudo docker build -t docker-machine-id-setup .
cd ../shared && sudo docker build -t electroncash-shared .
#sudo docker tag docker-machine-id-setup ajdjd/docker-machine-id-setup
sudo docker tag electroncash-shared ajdjd/electroncash:shared
cd ../latest && sudo docker build -t ec .
sudo docker rmi ajdjd/electroncash:shared
#sudo docker rmi ajdjd/docker-machine-id-setup
sudo docker tag ec electroncash
