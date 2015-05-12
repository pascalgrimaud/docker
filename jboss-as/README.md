<a href="http://jbossas.jboss.org/" target="_blank">
    <img src="https://raw.githubusercontent.com/pascalgrimaud/docker/master/jboss-as/as7_logo.png"/>
</a>

# Installation
```bash
cd 7.1.1/
docker build -t pgrimaud/jboss-as:7.1.1 .
```

To build JBoss 7.2, you have to download jboss-eap-6.1.0.zip and put it in the "7.2/" directory.

# Usage

Quick start with bidding to port 8080, 9990 and random password
```bash
docker run -d -p 8080:8080 -p 9990:9990 pgrimaud/jboss-as:7.1.1
```

To get the password
```bash
docker logs <id>
```

Start and set a specific password for jboss user
```bash
docker run -d -p 8080:8080 -p 9990:9990 -e JBOSS_PASS="pass" pgrimaud/jboss-as:7.1.1
```

To deploy a specific file.war, you need to make another container.
Create a new directory and put your file.war.
Then, create a new Dockerfile :
```bash
FROM pgrimaud/jboss-as:7.1.1
ADD file.war /jboss-as-7.1.1.Final/standalone/file.war
```


