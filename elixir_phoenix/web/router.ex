defmodule ElixirPhoenix.Router do
  use ElixirPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", ElixirPhoenix do
   pipe_through :api

   get "/hello-query", HelloController, :hello_query
   post "/hello-parse", HelloController, :hello_parse
  end
end
