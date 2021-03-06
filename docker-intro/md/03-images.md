# moar demos

Note:
cd ~/dev

mkdir dotnettest

cd dotnettest

docker run -it --rm -v "$PWD":/app -p 5000:5000 -e ASPNETCORE_URLS=http://+:5000 microsoft/aspnetcore-build:2.0

cd /app

dotnet new web

dotnet run

open http://localhost:5000

cd ~/dev

mkdir rubytest

cd rubytest

code .

create Gemfile

source 'https://rubygems.org'

gem 'sinatra'

create app.rb

require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  'Hello again!'
end

docker run -it --rm -v "$PWD":/app -p 4567:4567 ruby bash

cd /app

bundle

ruby app.rb

open http://localhost:4567/


cd ~/dev

mkdir phoenixtest

cd phoenixtest

docker run -it --rm -v "$PWD":/app -p 4000:4000 marcelocg/phoenix

cd /app

mix phoenix.new /app/

mix phoenix.server

open http://localhost:4000/

<..>
dotnet core 2.0 web app
<pre>
    <code data-trim data-noescape class="bash">
        docker run -it --rm -v "$PWD":/app -p 5000:5000 -e ASPNETCORE_URLS=http://+:5000 microsoft/aspnetcore-build:2.0

cd /app
dotnet new web
dotnet run
    </code>
</pre>
<..>
ruby web app (sinatra)
<pre>
    <code data-trim data-noescape class="bash">
        docker run -it --rm -v "$PWD":/app -p 4567:4567 ruby bash

cd /app
bundle
ruby app.rb
    </code>
</pre>
<..>
elixir web app (phoenix)
<pre>
    <code data-trim data-noescape class="bash">
        docker run -it --rm -v "$PWD":/app -p 4000:4000 marcelocg/phoenix

cd /app
mix phoenix.new /app/
mix phoenix.server
    </code>
</pre>
<..>

![](/images/cool.gif)