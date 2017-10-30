# vim:set ft=dockerfile:
FROM python:3.6.3-slim

ENV DEBIAN_FRONTEND="noninteractive"

COPY requirements.txt requirements.txt

RUN apt-get update -q \
 && apt-get install -yq --no-install-recommends \
    build-essential \
    cron \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    locales \
 && apt-get clean \
 && apt-get purge \
 && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
 && locale-gen en_US.UTF-8 \
 && dpkg-reconfigure locales \
 && /usr/sbin/update-locale LANG=en_US.UTF-8 \
 && pip install -r requirements.txt \
 && rm requirements.txt

ENV LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8" LC_ALL="en_US.UTF-8"
