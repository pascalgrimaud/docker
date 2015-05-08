<a href="http://jbossas.jboss.org/" target="_blank">
<img src="https://raw.githubusercontent.com/pascalgrimaud/docker/master/jboss-as/as7_logo.png"/>
</a>

# Installation
```bash
cd 9.3/
docker build -t pgrimaud/postgresql:9.3 .
```
# Usage

Quick start with bidding to port 5432 and random password
```bash
docker run -d -p 5432:5432 pgrimaud/postgresql:9.3
```

To get the password
```bash
docker logs <id>
```

Start and set a specific password for postgres user
```bash
docker run -d -p 5432:5432 -e POSTGRES_PASS="pass" pgrimaud/postgresql:9.3
```

Start and mount a volume for data persistence at /path
```bash
docker run -d -p 5432:5432 -v /path:/var/lib/postgresql pgrimaud/postgresql:9.3
```

If your forget the postgres user's password, delete the file at /path
```bash
sudo rm /path/.postgres_pass_modified
```
