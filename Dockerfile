FROM ruby:3.1.2-alpine as Builder

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    gcompat \
    git \
    tzdata

RUN gem install bundler

WORKDIR /teacherss

COPY . /teacherss/

RUN bundle install

FROM ruby:3.1.2-alpine as Final

RUN apk add --update --no-cache \
    build-base \
    postgresql-client \
    tzdata \
    file \
    git

COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder /teacherss/ /teacherss/

WORKDIR /teacherss

EXPOSE 3000
ENTRYPOINT [ "bin/docker-entrypoint" ]
