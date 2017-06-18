defmodule HelloQueryIntegrationTest do
  use ElixirPhoenix.ConnCase

  setup %{conn: conn} do
    conn
    |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "hello query with a name", %{conn: conn} do
    conn = get conn, "/api/v1/hello-query?name=foobar"
    body = json_response(conn, 200)
    assert body["hello"] == "foobar"
  end
end
