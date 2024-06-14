cd /home/user 
#install git if needed
sudo apt-get install git;

#clone repos
git clone https://source.quilibrium.com/quilibrium/ceremonyclient.git

cd ceremonyclient/node

#switch to release-cdn branch
git checkout release-cdn

# first start to generate .config folder
./release_autorun.sh & 

# let it run first time to create the folder, we give him 5s then we kill the node
sleep 5s 

pkill node-1.4.1 

#enable gRpc

sed -i 's#listenGrpcMultiaddr: ""#listenGrpcMultiaddr: "/ip4/127.0.0.1/tcp/8337"#g' /home/user/ceremonyclient/node/.config/config.yml

#enable rest

sed -i 's#listenRESTMultiaddr: ""#listenRESTMultiaddr: "/ip4/127.0.0.1/tcp/8337"#g' /home/user/ceremonyclient/node/.config/config.yml

# create service
sudo echo "[Unit]
Description=Ceremony Client Go App Service

[Service]
Type=simple
Restart=always
RestartSec=5s
WorkingDirectory=/home/user/ceremonyclient/node
ExecStart=/home/user/ceremonyclient/node/release_autorun.sh

[Install]
WantedBy=multi-user.target
" > /lib/systemd/system/ceremonyclient.service;

sudo service ceremonyclient start

#journalctl -u ceremonyclient.service -f --no-hostname -o cat
