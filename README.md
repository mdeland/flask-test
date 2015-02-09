# flask-test

Steps to setup linked development and digit ocean environment:

+ Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
+ `brew install boot2docker`
+ run: `boot2docker start`
+ set the `DOCKER_HOST` environment variables it asks you too (can also copy them to `.bashrc`)
+ install [docker-compose](https://github.com/docker/fig/releases) (used to be called fig)
+ setup your `docker-compose.yml` file
+ make sure the `Dockerfile` is the way you want it to describe the python container
+ run the build process: `docker-compose up`
+ make changes, test, run `docker-compose build` and then `docker-compose up`
+ to be able to debug using pdb, run `docker-compose run --service-ports web` (or the name of the python service)
+ to run the database script, from the dbjob directory run `docker build --rm -t dbjob .` then `docker run -it --link=flasktest_db_1:postgres dbjob reset.sh` 
