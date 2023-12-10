## Project 5 - CD
Name: Logan Scarberry
### Part 1 - Semantic Versioning 
- CD Project Overview
    - The purpose of this project is to continue what I've learned in Project 4 about `docker`, `webhook`, `apache2`, and `git`. The goal is to create an `EC2` instance with `AWS` that will serve as a server for `webhook`. Then, that server will act as a listener and be used to update my website. This means I'll be able to update my website from my own local machine by simply pushing to a repository and then having my server listen to that repository for updates.
- How to Generate a `tag` in `git`/ GitHub
    - `git commit -am "Your comment"`
    - `git tag -a v1.0.0` > Type in your comment otherwise use `-m` to comment
    - `git show v1.0.0` to display everything included in the version (`q` to quit). <br>
    ![git tag](images/2_1.PNG) <br>
    - `git push origin v1.0.0` To push the tagged commit. <br>
    ![git push](images/2_2.PNG)
    - Navigate back to the repository on GitHub to see that the tag was pushed. <br>
    ![git push example](images/2_3.PNG) <br>
    ![git push 2nd example](images/2_4.PNG)
    - 
- Behavior of GitHub workflow
    - 
- Link to [DockerHub repository](https://hub.docker.com/repository/docker/loberry/project4_repo/tags?page=1&ordering=last_updated)

### Part 2 - Development
- How to install Docker on instance:
    - `sudo apt-get update` <br>
    ![update](images/2_5.PNG)
    - `sudo vim /etc/apt/apt.conf.d/20auto-upgrades`
    - Set `APT::Periodic::Unattended-Upgrade` to `0` <br>
    ![disable upgrades](images/2_6.PNG)
    - `sudo apt-get install ca-certificates curl gnupg`
    - `sudo install -m 0755 -d /etc/apt/keyrings`
    - `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`
    - `sudo chmod a+r /etc/apt/keyrings/docker.gpg`
    - 
    ```
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```
    - `sudo apt-get update`
    - `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`
    - `sudo docker run hello-world` To verify docker installed successfully. <br>
    ![successful install](images/2_7.PNG)
    - `sudo docker pull loberry/project4_repo:latest` To verify a successful `pull`
    - `sudo docker run -i -t 7d174f9f23d6 /bin/bash` To `run` <br>
    ![docker run](images/2_8.PNG)
- Container Restart Script
    - Script:
    ```
    #!/bin/bash

    sudo docker pull loberry/project4_repo:latest

    sudo docker restart $(sudo docker ps -q)
    ```
    - The script is called `containerRestart.sh` and it's currently located in the home directory. While not the most secure location, it's currently placed there as a way for me to easily run it when using `ssh` into the server.
    - The script does 2 things:
        - `sudo docker pull loberry/project4_repo:latest`: This command pulls the latest docker image from my docker.
        - `sudo docker restart $(sudo docker ps -q)`: This command reads the name of all the container ids from a `docker ps` command and then uses them as a variable for the `docker restart` command. Meaning it will restart all my containers by the id pulled from `docker ps`.
        
