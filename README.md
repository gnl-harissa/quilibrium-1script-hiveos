# quilibrium-1script-hiveos
HiveOs beta installation Script.
Requirements : Latest HiveOS Beta on Ubutun 22.04

download hive.sh in /home/user

Run : 

sh hive.sh

journalctl -u ceremonyclient.service -f --no-hostname -o cat

when node is sync, you should see a line like this :
{"level":"info","ts":1718368730.7415237,"caller":"master/consensus_frames.go:83","msg":"setting syncing target","peer_id":"EiCfYHKZ4Q1flMwbObrOeQiBVlxQ+XFh1Y3MKw1U03xxCA=="}

Node is running as a service, so you can CTRL+C and kill journalctl if you want.

to see current balance (from /home/user/ceremonyclient/node) : ./node-1.4.19-linux-amd64 --node-info

Have fun mining QUIL on your hiveOS rig !
