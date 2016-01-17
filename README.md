# A docker image to deploy question2answer as container

This docker image is a based image to create an [question2answer](http://www.question2answer.org) server.

## Install and run

```bash
$ git clone https://github.com/Soletic/hosting-docker-ubuntu.git ./ubuntu
$ git clone https://github.com/Soletic/hosting-docker-mysql.git ./mysql
$ git clone https://github.com/Soletic/hosting-docker-phpserver.git ./phpserver
$ git clone https://github.com/Soletic/hosting-docker-question2answer.git ./q2a
$ docker build --pull -t soletic/ubuntu ./ubuntu
$ docker build -t soletic/mysql ./mysql
$ docker build -t soletic/phpserver ./phpserver
$ docker build -t soletic/question2answer ./q2a
$ mkdir ./q2a-www
$ docker run -d -h example.org --name=example.q2a -e WORKER_NAME=example -e WORKER_UID=1000 -e HOST_DOMAIN_NAME=example.org -v ./q2a:/var/www soletic/question2answer
```