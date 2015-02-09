# A simple helper docker for interacting directly with the database.
# Build: docker build --rm -t dbjob .

FROM postgres:9.3
RUN mkdir /usr/scripts
ADD scripts/ /usr/scripts/
WORKDIR /usr/scripts

ENTRYPOINT ["sh"]
