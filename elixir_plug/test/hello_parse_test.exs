defmodule HelloParseTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias ElixirPlug.Router

  @opts Router.init([])

  test 'parses body param' do
    request_map = %{"name" => "foo barbaz"};
    conn = conn(:post, "/api/v1/hello-parse", Poison.encode!(request_map))
    |> put_req_header("content-type", "application/json")
    |> Router.call(@opts)
    assert conn.state == :sent
    assert conn.status == 200
    assert Poison.decode!(conn.resp_body)["hello"] == "foo barbaz"
  end
end
