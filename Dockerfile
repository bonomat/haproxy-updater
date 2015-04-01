
FROM    haproxy:1.5

MAINTAINER Philipp Hoenisch philipp@hoenisch.at

# Enable EPEL for Node.js
#RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
#RUN     yum install -y npm vim
RUN      apt-get update && apt-get install -y curl vim
RUN      curl -sL https://deb.nodesource.com/setup | bash -
RUN      apt-get install -y nodejs


# Bundle app source
COPY . /src
# Install app dependencies
RUN cd /src; npm install

EXPOSE  3000
CMD ["node", "/src/index.js"]
