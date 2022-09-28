FROM ghcr.io/neotrade-ts/qwc-uwsgi-base:ubuntu-latest

ADD . /srv/qwc_service

# git: Required for pip with git repos
# postgresql-dev g++ python3-dev: Required for psycopg2-binary
RUN apk add --no-cache --update --virtual runtime-deps postgresql-libs
RUN apk add --no-cache --update --virtual build-deps git wget unzip postgresql-dev g++ python3-dev
RUN pip3 install --no-cache-dir -r /srv/qwc_service/requirements.txt
RUN apk del build-deps

ENV SERVICE_MOUNTPOINT=/
