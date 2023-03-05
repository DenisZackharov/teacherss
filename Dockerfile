FROM ruby:3.1.2-alpine as Builder

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    git \
    tzdata

RUN gem install bundler

WORKDIR /teacherss

COPY . /teacherss/

RUN bundle install

FROM ruby:3.1.2-alpine as Final

RUN apk add --update --no-cache \
    tzdata

COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder /teacherss/ /teacherss/

WORKDIR /teacherss

EXPOSE 3000
ENTRYPOINT [ "bin/docker-entrypoint" ]
