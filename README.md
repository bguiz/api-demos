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

## Author

[Brendan Graetz](http://bguiz.com)

## Licence

GPLv3
