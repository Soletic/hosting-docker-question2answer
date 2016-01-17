FROM solectic/phpserver
MAINTAINER Sol&TIC <serveur@soletic.org>

# Update ubuntu and install command line tools for container installation
RUN apt-get update && apt-get -y install wget

# Add question2answer configuration file in installation /tmp directory
ADD qa-config.php /tmp/qa-config.php

# Add installation script of container
ADD start-q2a.sh /root/scripts/start-q2a.sh

# Add supervisor configuration file for container
ADD supervisord-q2a.conf /etc/supervisor/conf.d/supervisord-q2a.conf

# Add apache configuration for question2answer virtualhost
ADD apache.confsite /etc/apache2/templates/default.confsite

# Make scripts executable
RUN chmod 755 /root/scripts/*.sh