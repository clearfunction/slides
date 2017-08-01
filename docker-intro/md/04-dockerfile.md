# dockerfile

>A Dockerfile is a text document that contains all the commands you would normally execute manually in order to build a Docker image. Docker can build images automatically by reading the instructions from a Dockerfile.

<..>

## anatomy of a dockerfile

<pre>
    <code>
    FROM !base! # the base image
    RUN !cmd! # execute a command
    WORKDIR !directory! # cd into a directory for RUN/ADD/COPY commands
    COPY !filename! # adds file to image
    EXPOSE !port! # exposes a port to the host
    CMD ["bash"] # the default command to run if nothing is passed in to run
    </code>
</pre>

<..>

## building an image

<pre>
    <code>
    docker build -t jesse/rubyexample .
    </code>
</pre>

<..>

## running an image

<pre>
    <code>
    docker run -it --rm -p 3000:3000 jesse/rubyexample
    </code>
</pre>

<..>

## full example

<pre>
    <code>
FROM ruby:2.4.1

# env variable to make it easy to read
ENV APP_HOME /app

# create the directory in the container
RUN mkdir $APP_HOME

# set the workdir for ADD/RUN/COPY cmds that follow
WORKDIR $APP_HOME

# install gems
ADD Gemfile* $APP_HOME/
RUN bundle install

# upload source from this directory into the image
COPY . $APP_HOME

# start server
ENV PORT 3000
EXPOSE 3000
CMD ["ruby", "app.rb"]
    </code>
</pre>
