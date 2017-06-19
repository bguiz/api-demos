defmodule HelloQueryTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias ElixirPlug.Router

  @opts Router.init([])

  test 'gets query param' do
    conn = conn(:get, "/api/v1/hello-query?name=foobar%20baz")
    |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 200
    assert Poison.decode!(conn.resp_body)["hello"] == "foobar baz"
  end
end
