FROM jenkins/jenkins:2.235.1
USER root
RUN apt-get update && apt-get -y install sudo software-properties-common curl apt-transport-https ca-certificates gnupg-agent
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN apt update
RUN apt-add-repository -y --update "deb http://ppa.launchpad.net/ansible/ansible/ubuntu disco main"
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt update
RUN apt-get -y install ansible git docker-ce-cli
USER jenkins
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]