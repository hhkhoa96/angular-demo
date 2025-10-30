FROM jenkins/jenkins:lts
USER root
RUN apt-get update && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest
USER jenkins
