# Zookeeper Docker Cluster
The shell scripts in this repository demonstrate how to run a Zookeeper docker cluster with each node on a different linux machine.

## How it works
The most crucial thing to make the nodes communicate are the environment variables provided in the docker run command.
* ZOO_MY_ID
* ZOO_SERVERS

### ZOO_MY_ID
ZOO_MY_ID is quite simple, if you're running nth node, just provide ZOO_MY_ID as 'n'.

### ZOO_SERVERS
ZOO_SERVERS is a bit tricky. It should contain connectivity configs for all the nodes with space separation.  
For example: ZOO_SERVERS="server.1=&lt;conf&gt; server.2=&lt;conf&gt; server.3=&lt;conf&gt;"  
The conf for each server is not fixed, it will vary for all 3 docker run(s).  
The conf of the server which is going to be started by the command, should have IP as 0.0.0.0, and ports would be zookeeper default ports.
For other confs, the IP of the machines they are running on will be used, and the ports would be the published docker container ports.
Check the scripts out for a working example.
