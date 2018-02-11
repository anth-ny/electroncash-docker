cd base && \
cd ../base && sudo docker build -t electroncash-base . && \
sudo docker tag electroncash-base ajdjd/electroncash:base && \
cd ../latest && sudo docker build -t ec . && \
cd ../dev && sudo docker build -t ecdev . && \
sudo docker rmi ajdjd/electroncash:base
