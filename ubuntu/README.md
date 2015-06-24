[![logo](https://raw.githubusercontent.com/pascalgrimaud/dockerfiles/master/images/ubuntu.png)]
(http://www.ubuntu.com/)



# Information

This image is used to set the locale to en_US.UTF-8.


The Docker builds on [CircleCI](https://circleci.com)
get this error when you attempt to change the locale from an Ubuntu image :

```
Step 3 : RUN locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale
 ---> Running in b24799cb6c0a
Generating locales...
cannot change mode of new locale archive: No such file or directory
  en_US.UTF-8... failed
Generation complete.
 ---> 7f9b8ce08b3c
 ```



# Installation
You can clone this project and build with docker command :

```
docker build -t pascalgrimaud/ubuntu .
```

