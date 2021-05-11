defmodule GAPIServer.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: GAPIServer.Routing.MainRouter, options: [port: 80]}
    ]

    opts = [strategy: :one_for_one, name: GAPIServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
