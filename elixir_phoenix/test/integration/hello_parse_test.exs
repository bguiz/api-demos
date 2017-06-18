defmodule HelloParseIntegrationTest do
  use ElixirPhoenix.ConnCase

  setup %{conn: conn} do
    conn
    |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "hello parse with a name", %{conn: conn} do
    conn = post conn, "/api/v1/hello-parse", name: "foobar"
    body = json_response(conn, 200)
    assert body["hello"] == "foobar"
  end
end
