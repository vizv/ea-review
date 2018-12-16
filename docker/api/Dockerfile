FROM ruby:2.5.1-alpine
RUN gem install bundler -v 1.17.1

WORKDIR /app

COPY api/Gemfile api/Gemfile.lock /app/
RUN apk --no-cache add --virtual .builddeps build-base sqlite-dev \
 && apk --no-cache add --virtual .runtimedeps sqlite-libs \
 && bundle install --deployment --without test development \
 && apk del .builddeps

COPY api /app

ENV RACK_ENV production
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "9292"]
