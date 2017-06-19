defmodule ElixirPlug.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: ElixirPlug.Worker.start_link(arg1, arg2, arg3)
      # worker(ElixirPlug.Worker, [arg1, arg2, arg3]),
      worker(__MODULE__, [], function: :run)
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirPlug.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run do
    { :ok, _ } = Plug.Adapters.Cowboy.http ElixirPlug.Router, []
  end
end
