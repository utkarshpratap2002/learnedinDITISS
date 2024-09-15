
### Difference between `127.0.0.1` and `0.0.0.0`

There is an important application of both the adresses as it touched the important point on netowrking.

* `127.0.0.1` is called loopback address, meaning when you bind your socket to loopback address, only the processes running on the same machine will be able to run it, otherwise any other machine trying to access the server will be rejected as it doesn’t expposes the network to other IPs. It is also called localhost address.
* `0.0.0.0` is called wildcard address, it is very important to know what it does. It tells machine to send all the available networks on the same network. Basically if you bind your socket to the wildcard address, you’ll be able to listen to all the networks that are available.
    * The network on local network can access the server (localhost)
    * All LAN can access the server
    * All interface allows the network connection


#### Next day topics
what is socket object?
It is only when we specify how we are going to recieve data on both end then only we are going to recieve the data. It will not happen anyway, if we send the data and it will pop up on the screen.