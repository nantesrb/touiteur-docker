FROM ruby:3.0.2-slim-bullseye

ARG APP_PATH=/app
ARG APP_USER=rails
ARG APP_GROUP=rails-apps
ARG APP_USER_UID
ARG APP_GROUP_GID

RUN apt-get update -qq \
  && apt-get install -y build-essential zlib1g-dev libssl-dev libreadline6-dev libcurl4-openssl-dev libxml2-dev libxslt-dev curl apt-transport-https git locales libsqlite3-dev

RUN echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen \
  && dpkg-reconfigure --frontend=noninteractive locales

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd -f -g ${APP_GROUP_GID} ${APP_GROUP} \
  && useradd -m -g ${APP_GROUP} -u ${APP_USER_UID} ${APP_USER} \
  && mkdir ${APP_PATH} \
  && chown ${APP_USER}:${APP_GROUP} ${APP_PATH}

WORKDIR ${APP_PATH}

USER ${APP_USER}

COPY --chown=${APP_USER}:${APP_GROUP} Gemfile* ${APP_PATH}/
RUN bundle install
