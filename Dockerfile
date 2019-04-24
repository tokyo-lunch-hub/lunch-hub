FROM rubylang/ruby:2.6.3-bionic
ENV LANG C.UTF-8
RUN apt update \
  && apt install --assume-yes \
    build-essential \
    curl \
    wget \
    gnupg2 \
  && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' \
  && wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add - \
  && apt update \
  && apt install --assume-yes \
    imagemagick \
    postgresql-client-9.6 \
    libpq-dev \
    postgresql-client \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*
ENV APP_ROOT /usr/local/src
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY Gemfile Gemfile.lock $APP_ROOT/
RUN bundle install --jobs=4
ADD . $APP_ROOT
