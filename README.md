# Alpine Squash TM Docker #

## Description

This repository is used for building a [**Docker**](https://www.docker.com) image containing [**Squash TM**](http://www.squashtest.org/en/decouvrir-squash-tm/contenu-statique/outils-et-fonctionnalites/squash-tm-test-management-en) running on [**Alpine Linux**](https://alpinelinux.org/)

## Dockerhub

`docker pull scalified/squash-tm`

## Version

|     #     | Version        |
|-----------|----------------|
| Alpine    | 3.4            |
| Squash TM | 1.14.2.RELEASE |

## Database

An embedded **H2** database is used for keeping **Squash TM** data

## Periodic Backups

An image is configured to perform daily backups into:

**`/opt/backup/squash-tm`**

Data in this directory is kept for the last **7 days**

## Volumes

The following directories are marked as volumes:
* **`/opt/squash-tm/data`**
* **`/opt/backup/squash-tm`**

### How-To

#### Building Squash TM Docker Image

To build a **Squash TM** Docker image from scratch, issue the following command:

`docker build . -t <tag>`

#### Running Squash TM Docker Image

To run the **Squash TM** Docker image, use the following commands:

* Pulling from **Dockerhub**:  
  `docker run -it scalified/squash-tm /bin/sh`

* Launching the built image with <tag> tag:  
  `docker run -it <tag> /bin/sh`

## Scalified Links

* [Scalified](http://www.scalified.com)
* [Scalified Official Facebook Page](https://www.facebook.com/scalified)
* <a href="mailto:info@scalified.com?subject=[Squash TM Docker Image]: Proposals And Suggestions">Scalified Support</a>
