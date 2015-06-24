[![logo](https://raw.githubusercontent.com/pascalgrimaud/dockerfiles/master/images/postgresql.png)]
(http://www.postgresql.org/)



# Information

This image is used as a PostgreSQL Server 9.3.



# Installation

You can clone this project and build with docker command :

```
docker build -t pascalgrimaud/postgresql:9.3 .
```



# Help

To display usage :

```
docker run --rm pascalgrimaud/postgresql:9.3 /help
```



# Usage

Quick start with binding to port 5432 and random password :

```
docker run -d -p 5432:5432 pascalgrimaud/postgresql:9.3
```


To get the password :

```
docker logs <container id>
```


Start and set a specific password for postgres user :

```
docker run -d -p 5432:5432 -e POSTGRES_PASS="pass" pascalgrimaud/postgresql:9.3
```



# Usage with volumes

Start and mount a volume for data persistence at ~/volumes/postgresql93/data :

```
docker run -d -p 5432:5432 -v ~/volumes/postgresql93/data:/var/lib/postgresql \
pascalgrimaud/postgresql:9.3
```


Start and mount a volume for data persistence at ~/volumes/postgresql93/data and logs at ~/volumes/postgresql93/logs :

```
docker run -d -p 5432:5432 -v ~/volumes/postgresql93/data:/var/lib/postgresql \
-v ~/volumes/postgresql93/logs:/var/log/postgresql pascalgrimaud/postgresql:9.3
```



If you forget the postgres user password, delete the file .password :

```
sudo rm ~/volumes/postgresql93/data/9.3/.password
```



# Docker compose with volumes

You can use the docker-compose.yml (edit this file first) :

```
docker-compose up
```

