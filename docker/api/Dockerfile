FROM ruby:2.5.1-alpine
RUN gem install bundler -v 1.17.1

WORKDIR /app

COPY api/Gemfile api/Gemfile.lock /app/
RUN bundle install --deployment --without test development

COPY api /app

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "9292"]
