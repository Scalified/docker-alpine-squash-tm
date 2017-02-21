# Alpine Squash TM Docker #

[![Docker Pulls](https://img.shields.io/docker/pulls/scalified/alpine-squash-tm.svg)](https://hub.docker.com/r/scalified/alpine-squash-tm)
[![](https://images.microbadger.com/badges/image/scalified/alpine-squash-tm.svg)](https://microbadger.com/images/scalified/alpine-squash-tm)
[![](https://images.microbadger.com/badges/version/scalified/alpine-squash-tm.svg)](https://microbadger.com/images/scalified/alpine-squash-tm)

## Description

This repository is used for building a [**Docker**](https://www.docker.com) image containing [**Squash TM**](http://www.squashtest.org/en/decouvrir-squash-tm/contenu-statique/outils-et-fonctionnalites/squash-tm-test-management-en) running on [**Alpine Linux**](https://alpinelinux.org/)

## Dockerhub

**`docker pull scalified/squash-tm:<version>`**

## Version

| Version                | Alpine | Squash TM |
|------------------------|--------|-----------|
| **1.14.2**             | 3.4    | 1.14.2    |
| **1.15.1**, **latest** | 3.4    | 1.15.1    |

## Database

An embedded **H2** database is used for keeping **Squash TM** data

## Periodic Backups

An image is configured to perform daily backups into:

**`/opt/backup/squash-tm`**

Data in this directory is kept for the last **7 days**

## Volumes

* **`/opt/squash-tm/data`**
* **`/opt/backup/squash-tm`**

* **`/etc/supervisor.d`**
* **`/var/spool/cron`**
* **`/etc/periodic`**

### How-To

#### Building Squash TM Docker Image

`docker build . -t <tag>`

#### Running Squash TM Docker Image

* Pulling from **Dockerhub**:  
  `docker run -it scalified/squash-tm:<version> /bin/sh`

* Launching the built image with <tag> tag:  
  `docker run -it <tag> /bin/sh`

## Scalified Links

* [Scalified](http://www.scalified.com)
* [Scalified Official Facebook Page](https://www.facebook.com/scalified)
* <a href="mailto:info@scalified.com?subject=[Squash TM Docker Image]: Proposals And Suggestions">Scalified Support</a>
