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

To get the password
```bash
docker logs <id>
```

Start and set a specific password for jenkins user
```bash
docker run -d -p 8080:8080 -e JBOSS_PASS="pass" pgrimaud/jenkins
```

