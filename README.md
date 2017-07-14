# API demos

## Goal

Try out a bunch of different platforms, and the frameworks available on those platforms.

For each one, the goal is very simple:

1. Set up a HTTP web server
2. Serve a JSON response for a simple "hello" API
   - Request: `GET /api/v1/hello-query?name=$NAME`
   - Response: `{"hello": "$NAME"}`
3. Serve a JSON response for a JSON post API
   - Request: `POST /api/v1/hello-parse` with body `{"name": "$NAME"}`
   - Response: `{"hello": "$NAME"}`

Implementation requirements:

1. The full set up instructions, including the set up for both the platform and the framework
   should be added in a `SETUP.md` for each one.
2. The JSON in requests and responses should be (de)serialised using JSON operators/ functions,
   and not using string templates.
3. A `.gitignore` file appropriate for the platform/ framework combination
   should be created if not created by default.
4. Automated tests should be written and placed appropriately for the platform and framework.
   Manual tests should be added to `SETUP.md`.

## Running each server

`cd` into the relevant folder,
and follow the instructions in `SETUP.md`.
The instructions assume that
you presently have no tools or libraries installed,
and therefore include instructions for obtaining them.
You may choose to skip the steps which you do not need.

In a separate terminal/ shell,
run the following commands,
and observe the responses from the server:

```bash
$ curl -X GET -w "\n%{http_code}\n" http://localhost:4000/api/v1/hello-query?name=foobar%20baz
{"hello":"foobar baz"}
200

$ curl -X POST -w "\n%{http_code}\n" -H "Content-Type: application/json" -d '{"name":"foo barbaz"}' http://localhost:4000/api/v1/hello-parse
{"hello":"foo barbaz"}
200
```

## Author

[Brendan Graetz](http://bguiz.com)

## Licence

GPLv3
