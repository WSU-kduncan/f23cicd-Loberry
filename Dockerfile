# Creating base image
FROM ubuntu

# Specify the author
LABEL Logan Scarberry

# Copying all files to the container
COPY . .

# Installing dependencies (apache2 and git)
RUN apt-get update && \
    sudo apt install apache2 -y && \
    apt-get install -y git && \
    reboot

# Define port number
EXPOSE 5000

# Run the command
CMD ["http://localhost/index.html"]
