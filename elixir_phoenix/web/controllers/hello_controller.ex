defmodule ElixirPhoenix.HelloController do
  use ElixirPhoenix.Web, :controller

  def hello_query(conn, params) do
    name = params["name"]
    response_map = %{"hello" => name}
    conn
    |> put_status(200)
    |> json(response_map)
  end

  def hello_parse(conn, params) do
    name = params["name"]
    response_map = %{"hello" => name}
    conn
    |> put_status(200)
    |> json(response_map)
  end
end
