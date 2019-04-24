FROM rubylang/ruby:2.6.2-bionic
ENV LANG C.UTF-8
ENV APP_ROOT /usr/local/src
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY Gemfile Gemfile.lock $APP_ROOT/
RUN bundle install --jobs=4
ADD . $APP_ROOT
