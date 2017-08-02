# dockerfile

>A Dockerfile is a text document that contains all the commands you would normally execute manually in order to build a Docker image. Docker can build images automatically by reading the instructions from a Dockerfile.

<..>

## anatomy of a dockerfile

<pre>
    <code>
    FROM ruby # the base image
    RUN ruby app.rb # execute a command
    WORKDIR /app # cd into a directory for RUN/ADD/COPY commands
    COPY . /app # adds file to image
    EXPOSE 3000 # exposes a port to the host
    CMD ["bash"] # the default command to run if nothing is passed in to run
    </code>
</pre>

Note:

cd ~/dev/dockerfile

code .

docker build -t jesse/rubyexample .

docker run -it --rm -p 4567:4567 jesse/rubyexample

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
    docker run -it --rm -p 4567:4567 jesse/rubyexample
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
COPY Gemfile* $APP_HOME/
RUN bundle install

# upload source from this directory into the image
COPY . $APP_HOME

# start server
ENV PORT 3000
EXPOSE 3000
CMD ["ruby", "app.rb"]
    </code>
</pre>
