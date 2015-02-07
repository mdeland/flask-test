# flask-test

Steps to setup linked development and digit ocean environment:

+ Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
+ `brew install boot2docker`
+ run: `boot2docker start`
+ set the `DOCKER_HOST` environment variables it asks you too (can also copy them to `.bashrc`)
+ make sure the `Dockerfile` is the way you want it
+ run the build process: `docker build --rm -t TAG_NAME .` from the repo (slow the first time)
+ run the container `docker run -p 80:80 TAG_NAME`
+ add the repo to [DockerHub](https://registry.hub.docker.com) (one free private repo)
+ at this point, `DockerHub` will build on pushes to master
