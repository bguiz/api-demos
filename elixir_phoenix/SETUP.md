## Set up

```bash
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
  sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang elixir
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
mix phoenix.new elixir_phoenix --no-brunch --no-ecto
cd elixir_phoenix
mix deps.get
mix phoenix.server
```
... or follow detailed instructions at: http://www.phoenixframework.org/docs/installation

## Manual tests

```bash
$ curl -X GET -w "\n%{http_code}\n" http://localhost:4000/api/v1/hello-query?name=foobar%20baz
{"hello":"foobar baz"}
200

$ curl -X POST -w "\n%{http_code}\n" -H "Content-Type: application/json" -d '{"name":"foo barbaz"}' http://localhost:4000/api/v1/hello-parse
{"hello":"foo barbaz"}
200
```
