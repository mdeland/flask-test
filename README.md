# flask-test

Steps to setup linked development and digit ocean environment:

+ Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
+ `brew install boot2docker`
+ run: `boot2docker start`
+ set the `DOCKER_HOST` environment variables it asks you to (can also copy them to `.bashrc`)
+ install [docker-compose](https://github.com/docker/fig/releases) (used to be called fig)
+ setup your `docker-compose.yml` file
+ make sure the `Dockerfile` is the way you want it to describe the python container
+ to run the database script (which will have to be before initial run, in this example) run `docker-compose up db` to start the database, from the dbjob directory run `docker build --rm -t dbjob .` then `docker run -it --link=flasktest_db_1:postgres dbjob reset.sh` 
+ run the build process: `docker-compose up`.  To run in the background use the `-d` flag
+ make changes, save, test, and if necessary, run `docker-compose build` and then `docker-compose up`
+ to be able to debug using pdb, run instead with `docker-compose run --service-ports web` (or the name of the python service)

