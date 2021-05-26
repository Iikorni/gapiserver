defmodule GAPIServer.Routing.Network.MessageRouter do
  use Plug.Router

  plug :match
  plug :dispatch


  get "/Inbox" do
    conn
    |> send_resp(200, MapToXml.from_map(
      %{
        "NetworkMessageInboxResult" => %{
          "Message" => [
            %{
              "MsgNo" => 2,
              "Readed" => 1,
              "UserID" => "ttttt",
              "Date" => "2021-05-21",
            },
            %{
              "MsgNo" => 2,
              "Readed" => 1,
              "UserID" => "test3",
              "Date" => "2021-05-21",
            },
          ]
        }
      }
    ))
  end


  match _ do
    send_resp(conn, 404, "")
  end
end
