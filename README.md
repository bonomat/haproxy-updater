This Docker Container contains HAProxy and a sime nodeJS service to update its configuration

THIS IS NOT SECURE, USE ON OWN RISK

how to use:

* build
sudo docker build -t bonomat/ha-updater . 

* run
sudo docker run  --name ha -p 3000:3000 -p 1936:1936 -p 8082:8081 -d bonomat/ha-updater

post file via curl:
curl -i -F file=@Localfile localhost:3000/api/files

or visit 
http://localhost:3000/

http://localhost:8082/google/

http://localhost:1936/

