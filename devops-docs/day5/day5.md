# Docker

You create a Docker container from an image, which are the collection of files that are using the `docker run` command. Here's a breakdown of how it works and some examples:

**Basic `docker run` Command:**

```bash
docker run <image_name>
```

* `<image_name>`: The name of the image you want to use to create the container. This can include a tag (e.g., `nginx:1.23`) or digest.  If no tag is specified, Docker defaults to `latest`.

**Example: Running a Simple Nginx Web Server**

```bash
docker run -d -p 8080:80 nginx
```

* `-d`: Runs the container in detached mode (in the background).
* `-p 8080:80`:  Publishes port 80 inside the container to port 8080 on your host machine. This allows you to access the Nginx web server running inside the container by navigating to `http://localhost:8080` in your web browser.
* `nginx`: The name of the Nginx image.


**Key `docker run` Options:**

* `-d` (detach): Run container in the background.
* `-it` (interactive tty):  Keeps STDIN open even if not attached and allocates a pseudo-TTY connected to the container's STDIN.  Useful for running interactive commands inside the container.
* `-p <host_port>:<container_port>` (publish):  Maps a port on the host to a port inside the container.
* `-v <host_directory>:<container_directory>` (volume):  Mounts a directory from your host machine into the container.  This allows you to persist data even after the container is stopped or removed.
* `--name <container_name>`: Gives the container a specific name.  If you don't use this option, Docker will assign a random name.
* `--rm` (remove): Automatically removes the container when it exits.  Useful for short-lived containers.
* `-e <KEY>=<VALUE>` (environment variable): Sets environment variables inside the container.
* `--network <network_name>`: Connects the container to a specific Docker network.
* `--restart <restart_policy>`: Specifies the container's restart policy (e.g., `always`, `on-failure`, `unless-stopped`).

**Example: Running a Python Script inside an Ubuntu Container**

```bash
docker run -it --rm -v $(pwd):/app ubuntu:latest bash
```

This command:

* Runs an Ubuntu container interactively (`-it`).
* Automatically removes the container when it exits (`--rm`).
* Mounts your current working directory (`$(pwd)`) to `/app` inside the container (`-v $(pwd):/app`).
* Starts a bash shell inside the container.

Once inside the container, you can navigate to `/app` (which contains your current directory's files) and run your Python script.


**Workflow Example:**

1. **Pull an Image:**  `docker pull ubuntu:latest`
2. **Run a Container:** `docker run -it ubuntu:latest bash`
3. **Interact with the Container:** (You'll be inside the container's shell)
4. **Exit the Container:**  Type `exit`


**Managing Containers:**

* `docker ps`: List running containers.
* `docker ps -a`: List all containers (running and stopped).
* `docker stop <container_id>` or `docker stop <container_name>`: Stop a running container.
* `docker start <container_id>` or `docker start <container_name>`: Start a stopped container.
* `docker rm <container_id>` or `docker rm <container_name>`: Remove a stopped container.


By understanding these basic `docker run` options and commands for managing containers, you can effectively create and control your Dockerized applications. Remember to consult the official Docker documentation for a complete list of options and more advanced usage scenarios.

There are two types of the image registry, thes collection of image repositor are of two types, **public** and **private**. 

- **Public Images** - The images that are available public and accessbile through internet.
- **Private Images** - These images are available privately within the organisation.

# Docker Container

- A single Container runs only one container at a time, meaning if you need to run more than one containers then you only will be able to run on application at a time. 

- Create a container
```
❯ docker container create hello-world
595df75222793e4d73674fdc7e7d1f431a55af90327a495431efd23097fd9e02
```

- The container is created not yet running.
```
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS                   PORTS                  NAMES
595df7522279   hello-world   "/hello"                 45 seconds ago   Created                                         vigilant_turing
```

- When you start running the container, you would see something like this. It can be started using the `docker container start <container-id/name>`.

```
CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS                      PORTS                  NAMES
595df7522279   hello-world   "/hello"                 2 minutes ago   Exited (0) 30 seconds ago                          vigilant_turing
```

Basically there are three statuses, **Created**, **Running**, and **Exited**.

If you are using the command docker container create --name myhttpd httpd running the container for the specific image, it won't run your container contineously but what we want is to run the container in the dettached mode and to do this, you need to run the container using the following command.

```bash
docker container run --name <container-name> -d <image-name>
```

- In native machine, the process pid for every prpocess is the 1 for the **init**, but the process.

- So, the application that container is running it the only going to be the first process pid that the whole container will have.

- That is the most lightweight version of linux running the application.  

# How container Communicates?

A dummy port is created on the machine to serve the service on a respective port, say port 8000, as the port 8000 is the port number at which the client will send the request and the container will forward the request by recognising the port service for the 8000. This can be done using the following command:

```bash 
docker run -d --rm --name nc -p 8080:80 nginx
```

Now You can go and check for the `localhost:8080`, you might see the same result, basically the same service, this is called **Port Forwarding**.

# Customizing Docker Images

It is like building a custom image with a custom application or custom configuration, it means you are to create a **Dockerfile** and add the required commands. What are you putting in your Dockerfile matter because it will tell the docker in what way the images are to be build and while you'll be starting and running the container, how and what environment the docker will use is decided in **Dockerfile**.

```
# Dockerfile
FROM <base-image>
COPY <src-path> <destination-path>
EXPOSE <port-number>
```

After creating a Dockerfile, you need to start the 

# Running a Python Application



