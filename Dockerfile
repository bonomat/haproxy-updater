
FROM    ubuntu:trusty

MAINTAINER Philipp Hoenisch philipp@hoenisch.at

# Install HAProxy
#
RUN apt-get update 
RUN apt-get install -y python-software-properties software-properties-common 
RUN add-apt-repository ppa:vbernat/haproxy-1.5
# RUN apt-get update 

# Install Node.js and npm and haproxy
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs vim haproxy


# Bundle app source
COPY . /src

# Install app dependencies
RUN cd /src; npm install

RUN touch /etc/default/haproxy
RUN echo 'ENABLED=1' >> /etc/default/haproxy

COPY haconfig.cfg /etc/haproxy/haproxy.cfg

EXPOSE  3000 8081
#CMD ["service", "haproxy", "start"]
#CMD ["node", "/src/index.js"]
CMD ["sh","/src/start.sh"]
