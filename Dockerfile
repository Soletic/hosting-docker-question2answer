FROM solectic/phpserver
MAINTAINER Sol&TIC <serveur@soletic.org>

# Update ubuntu and install command line tools for container installation
RUN apt-get update && apt-get -y install wget

# wget question2answer, unzip and create configuration file in /tmp directory
RUN cd /tmp && wget https://github.com/q2a/question2answer/archive/master.zip && \
	unzip master.zip && cp qa-config-exemple.php qa-config.php

# Add installation script of container
ADD start-q2a.sh /root/scripts/start-q2a.sh

# Add supervisor configuration file for container
ADD supervisord-q2a.conf /etc/supervisor/conf.d/supervisord-q2a.conf

# Add apache configuration for question2answer virtualhost
ADD apache.confsite /etc/apache2/templates/default.confsite

# Make scripts executable
RUN chmod 755 /root/scripts/*.sh