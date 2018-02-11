cd shared
cd ../shared && sudo docker build -t electroncash-shared .
sudo docker tag electroncash-shared ajdjd/electroncash:shared
cd ../latest && sudo docker build -t ec .
cd ../dev && sudo docker build -t ecdev .
sudo docker rmi ajdjd/electroncash:shared
