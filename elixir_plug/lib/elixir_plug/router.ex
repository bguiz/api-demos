defmodule ElixirPlug.Router do
  use Plug.Router

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug :match
  plug :dispatch

  get "/api/v1/hello-query" do
    conn = fetch_query_params(conn)
    response_map = %{"hello" => conn.params["name"]}
    response_json = Poison.encode!(response_map)
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, response_json)
  end

  post "/api/v1/hello-parse" do
    {:ok, body, conn} = read_body(conn)
    request_map = Poison.decode!(body)
    response_map = %{"hello" => request_map["name"]}
    response_json = Poison.encode!(response_map)
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, response_json)
  end
end
