[![CI](https://github.com/DenisZackharov/teacherss/actions/workflows/main.yml/badge.svg)](https://github.com/DenisZackharov/teacherss/actions/workflows/ci.yml)

# README

This Application help teachers for planning study year, with creating workload by hours taking into account that teachers in period 5-9 same, and something interesting feature in future

### Getting started

### Setup Project

1. Clone project `git clone https://github.com/DenisZackharov/teacherss.git`
2. Install gems and yarn packages with run commands bellow `bundle`, `yarn`
3. Create database, and run migrations `bin/rails db:create` `bin/rails db:migrate`
4. For running server run `bin/dev`

### Scripts

#### Standard

* `bin/dev` - to run server localy without docker
* `bin/rspec` - to start tests localy

#### Docker

* `bin/docker-setup` - build Docker image and prepare DB
* `bin/docker-server` - to run server with docker
* `bin/docker-test` - to run test localy from docker
* `bin/docker-quality` - to run quality checkers
* `bin/docker-sync` - install docker-sync library to speed up performance on Mac OSX
