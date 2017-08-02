# docker compose

> Tool for defining and running complex applications with docker in a single file.

<..>

## example

<pre>
    <code>
version: '3'
services:
  db: # a named service (in this case, db)
    image: postgres # image name
  web: # named web
    build: . # use the local dockerfile
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/app # mount the current directory to /app
    ports:
      - "3000:3000" # expose port 3000 as port 3000
    depends_on:
      - db # define the required relationship
    tty: true
    stdin_open: true
    </code>
</pre>

<..>

# Demo

Note:
cd ~/dev
mkdir railsexample
cd railsexample

create Gemfile

source 'https://rubygems.org'
gem 'rails', '5.0.0.1' 

create Dockerfile
FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

COPY . $APP_HOME 

create docker-compose.yml
version: '3'
services:
  db: # a named service (in this case, db)
    image: postgres # image name
  web: # named web
    build: . # use the local dockerfile
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/app # mount the current directory to /app
    ports:
      - "3000:3000" # expose port 3000 as port 3000
    depends_on:
      - db # define the required relationship
    tty: true
    stdin_open: true

generate a rails app

docker-compose run web rails new . --force --database=postgresql

build images

database.yml file update

host: db
username: postgres
password:

docker-compose build


docker-compose run web rails db:create

docker-compose up

open http://localhost:3000

docker-compose exec web bash

docker attach !containerid! # to use something interactive like pry
docker-compose exec web bash # to get a prompt in the container by name
docker-compose stop # stops everything
docker-compose down # destroys everything (including your db! since we didn't use a volume or anything to keep it on the host in this case)

<..>

## ruby on rails example

Gemfile
<pre>
    <code>
    source 'https://rubygems.org'
    gem 'rails', '5.0.0.1'   
    </code>
</pre>
<pre>
    <code>
    touch Gemfile.lock
    </code>
</pre>

<..>
## dockerfile
<pre>
    <code>
    FROM ruby:2.4.1
    RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

    ENV APP_HOME /app

    RUN mkdir $APP_HOME

    WORKDIR $APP_HOME

    ADD Gemfile* $APP_HOME/
    RUN bundle install

    COPY . $APP_HOME    
    </code>
</pre>

<..>
## generate a rails site
<pre>
    <code>
docker-compose run web rails new . --force --database=postgresql
    </code>
</pre>

## build the image(s)
<pre>
    <code>
docker-compose build
    </code>
</pre>

<..>
## database.yml update
<pre>
    <code>
        host: db
        username: postgres
        password:
    </code>
</pre>

<..>
## run the images
<pre>
    <code>
    docker-compose up
    </code>
</pre>
<..>
## run rails migration
<pre>
    <code>
    docker-compose run web rake db:create
    </code>
</pre>
<..>
## additional commands
<pre>
    <code>
docker attach !containerid! # to use something interactive like pry
docker-compose exec web bash # to get a prompt in the container by name
docker-compose stop # stops everything
docker-compose down # destroys everything (including your db! since we didn't use a volume or anything to keep it on the host in this case)
    </code>
</pre>
