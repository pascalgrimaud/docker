<a href="https://jenkins-ci.org/" target="_blank">
    <img src="https://raw.githubusercontent.com/pascalgrimaud/docker/master/jenkins/jenkins.png" width="50%" height="50%"/>
</a>

# Installation
```bash
docker build -t pgrimaud/jenkins .
```
# Usage

Quick start with bidding to port 8080
```bash
docker run -d -p 8080:8080 pgrimaud/jenkins
```

Start and mount a volume for data persistence at /path
```bash
docker run -d -p 8080:8080 -v ~/volumes/jenkins:/jenkins pgrimaud/jenkins
```
# Description

TODO : about volume, settings.xml
