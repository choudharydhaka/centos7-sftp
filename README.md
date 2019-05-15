# centos7-sftp
This image has centos7 running OpenSSL Sftp server configured on port 22, you must supply a username, share directory and password in order to run this image.

# Build
Please use the script ``` build.sh``` to build the docker image

```Note: build.sh file create a docker image named "dhaks\centos7-sftp:1.0.0"```

---
# Run
## Run using Docker 
```
docker run \
    -v share:/home/foo/share \
    -p 2222:22 -d dhaks\centos7-sftp \
    foo:123:1001
```
``` Note: username is "foo" with password "123" and userid "1001"```
## Run using Docker-compose
### Prerequisite
-  directory name "share" ``` mkdir share```
-  docker-compose installed

### Step 1  Create directory **share**
``` 
mkdir share 
chmod 777 share
```
### Step 2: Create **docker-compose .yml** file 
#### docker-compose.yml
```yml
version: '2'
services:
  sftp:
    image: dhaks/centos7-sftp:1.0.0
    hostname: sftp
    domainname: esb2.mbiedev
    ports:
      - "2222:22"
    volumes:
      - ./share:/home/foo/share
    entrypoint: ["/root/run","foo:123:1001" ]
```

### Step 3: Start container
```
docker-compose up -d
```
### Step 4: login
```
sftp -P 2222 foo@localhost
```


