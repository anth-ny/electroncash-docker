cd shared
cd ../shared && sudo docker build -t electroncash-shared .
sudo docker tag electroncash-shared ajdjd/electroncash:shared
cd ../latest && sudo docker build -t ec .
sudo docker rmi ajdjd/electroncash:shared
sudo docker tag ec electroncash
