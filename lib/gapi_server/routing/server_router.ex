defmodule GAPIServer.Routing.ServerRouter do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/LandServer" do
    conn
    |> send_resp(200, MapToXml.from_map(
      %{
        "ServerLandServerResult" => %{
          "LandServer" => %{
            "Name" => "Test",
            "IP" => "127.0.0.1",
            "PortNo" => 8000,
            "Selected" => 0,
            "Population" => 0
          }
        }
      }
    ))
  end

  match _ do
    send_resp(conn, 404, "")
  end
end
