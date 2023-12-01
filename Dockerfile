# Creating base image
FROM ubuntu

# Specify the author
LABEL Logan Scarberry

# Copying all files to the container
COPY . .

# Installing dependencies (apache2, and git)
RUN apt-get update && \
apt-get install curl -y && \
apt install apache2 -y && \
apt-get install -y git && \
cd website && \
cp index.html /var/www/html/index.html && \
/etc/init.d/apache2 start


# Define port number
EXPOSE 80

# Run the command to verify the container is running
CMD ["curl", "localhost"]