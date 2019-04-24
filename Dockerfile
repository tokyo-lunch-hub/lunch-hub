FROM rubylang/ruby:2.6.2-bionic
ENV LANG C.UTF-8
RUN apt update \
  && apt install --assume-yes \
    curl \
    wget \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*
ENV APP_ROOT /usr/local/src
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
COPY Gemfile Gemfile.lock $APP_ROOT/
RUN bundle install --jobs=4
ADD . $APP_ROOT
