# Understanding Process and Threads

*What is socket?* A gatway to communicate with other mahines, requires a port number:

* what’s port number? An integer value,  assigned to every process to every OS, used to comminicate with other process.
* There are two types of port numbers:
    * Reserved ports 
        * well-known ports
            * ports < 1024
            * eg. http(80), https(443), dns(52), etc
        * reserved ports
            * which are used by fameous servers
            * eg. mysqp(3306), mongodb (27017), redis (6379) etc.
    * Non-reserved ports
        * ports which are > 1024 are not reserved
        * OS randomly assigns ports to them
* So what is a process? Process is a running instance of a program
* program : set of instriuction stored in a file 
* It uses Process control block (PCB)
* Program can be stored on the disk, but needs to be loaded inside the memory.
* what is thread? It is called execution of process, every process contains at least on thread, asynchroneuous or parallel code execution, all thread within a process shares 
* Then there are two types of processes:
    * Single threaded process
    * Multi threaded process

Okay so what is whole story? The part within the operating system, named as loader, loads the executable file. An OS has this has insepratble part Loader, in machine we hav emanu hrdware components and we can talk them unless we know the detailed instruction, that is why OS help to perfom instruction using OS, it does everything for you. 

* Memory is divided when you boot your OS, this called when booting process hits. This loader when it gets loaded in the Memory, RAM. There starts a process.
*  What do you have inside the process? First the code will be loaded in memory, inside code section, data section, stack, where it starts creating function activation record, then there is heap memory, both of them will store some data.

If you’ve heard about stack overflow, that means the memory is full, while if you talk about the heap memroy, it is created for storing dymanic data types.

* when we create a function, we store alocal function, variables, heap section store as many objects, but stack can’t do that, can’t crate that many of stack frames. When a function is created, it is created in a stack.
* Then there are registers? It is the static memeory getting stored in the memory, what values variables contains and it contains the memory in stateof memory.
```
# sequential execution of code
print_number().       # Function take s1 sec time nap
print_characters()    # Function takes 1 sec time nap
Output:
...
```
* Though it is possible for two differnt programs, two different processes can be done asynchrneously, parallel to each other, that is called multi-threaded application. 

Thus, threading is always created by Operating system, thus when you use `import threading`, you are going to instruct the operating system to create thread for your program.
```
import threading, time

def print_name(names = ["Reva", "Mrdhvi", "Kuvira", "Krtvi"]):
    
    for name in names:
        print(f"Hello {name}")
        time.sleep(1)

def print_num(nums = []):

    nums = list(range(400, 420, 3))
    
    for num in nums:
        print(f"ERROR: {num}")
        time.sleep(1)


# asynchrneous execution of code
t1 = threading.Thread(target=print_names) # Not uses the `()` because this is function reference
t2 = threading.Thread(target=print_nums)

# starting the thread
t1.start()
t2.start()

# wait till both the threads are executing
t1.join()
t2.join()
```
* `t1.join()` and `t2.join()` means that, it tells python to wait until the other program gets executed.
* You can see that parallel execution can increase the performance of the application.

But nowadays, threads contains it own stack and registers, thus but this doesn’t mean that threads start to having their own segment in the memory, threads still are part of one process only. 

Memory hierarchy, from fastest to slowest. Fasteset is called static memory, slowest is called dynamic memeory

* static memory ,containes registers inside the CPU, meaning the one that cannot be changed, L1, L2, and L3
* dynamic memroy, meaning, RAM, which is slower than static memory.
* primary memory, which includes SSD, HDD, external storage.

Registers, it includes some data that are used while the instructions are executed, becasue whenthe instruction will be getting executed, that info* in registers is used whlie the execution of the program. 

So, what we understand? We do that when we need to communicate with other machines you do that using process, we use socket for the communication, that uses process, which becomes a gateway to communicate over the end-points. To be concise and simple, socket becomes a gateway that allows communication on same machine as well as to other machine.  

Basically, we create a socket program (which means a process), and this process establishes the connection using Port number on a machine which is bound to serve a specific process. On another machine, a corresponding process is created using it’s own socket and can be connected using the specific port number, thus establishing the communication channel.

what is server? A server is software that seves a purpose, that means when we create a socket, we create a process with specific port number, essentially restricted it to a specific port number, meaning any corresponding process, process with the same port number, will be connected to our process. 

* A socket that binds the process to a speicfic port tells your operating system about the server creation, meaning, any network traffic, that has the same port, should be directed to my process. After then, server handles what is needed to be done with the traffic.
* A Port number only helps OS in identification of tasks, that “send me or direct me all the traffic to this port number, my process so-n-so is running on this port number!”

The story of socket is easy, socket works with two things, Port number and ip address of the machine. And it is only obvious that we’ll have programs running, one for server as server.py and another for client as client.py. 

* What our server will do? Server will create a socket and will bind it the specific port, and will recieve any incomming traffic on the port and will accept it, once it will connect the client, it will send the message to the client.
* What client is doing? Client creates a socket on it’s end to be able to communicate with process using the port number, by specifying the IP address of the machine and able to send the data. 

### `server.py`

* Import the `socket` module.
```
import socket
```
* Now specify the host and port.
```
host, port = '0.0.0.0', 4004 # Port needs non-priveleged and can be anything
```
* Now we need ot create the socket and bind it to the port and host.

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((host, port))
    s.listen(5)  # tells the server to handle upto 5 connection in the queue

* Now that we have bind the connection to accept any network traffic and  specific port , we can now handle the data or connection reaching out to us.
    * Here, `conn, info = s.accept()` is waiting for any connection and accepting the connection, thus returning a new socket to be used and ip address of the client.
    * You can also put `conn, info = s.accept()` in loop as to accept infinite connection using `while True:`
```
conn, info = s.accept()

with conn:
    print(f"Connected by {info}")
    while True:
           data = conn.recv(1024)
                if not data: break
                print(f"Recieved data: {data.decode('utf-8')}")
                conn.sendall(data)
```
* Here `with conn` specifies that the connection is handled with that specific connection we are connected to and wil ensure that once the block of action on the data recieced is completed, the connection will be closed automatically. Once the data transmission stops (which we’ll use a conditinal statement within the `with conn`). It will happen only when client will stop transmitting data.
* Here, `print(f”Connected to {info}”)` prints the ip address (client) connected.
* `data = conn.recv(1024)` means the data is being recived from the client the client, and `if not data: break`if there is not data, the connection will break.
* `print(f"Recieved data: {data.decode('utf-8')}")` prints the data being recieved. In our case, data that we recieved is the collection dictionary.
```
utkarshsingh@Utkarshs-MacBook-Air socket % python3 my_server.py
Connected by ('127.0.0.1', 57773)
Recieved data: {"name": "Reva", "place": "Pune", "hobbies": "Reading"}
```
* Here, `conn.sendall(data)` implements the `echo` mechanism that is similar to printing data recieved to the client.


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