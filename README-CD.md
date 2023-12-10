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
- Link to DockerHub repository:

### Part 2 - Development