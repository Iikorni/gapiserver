defmodule GAPIServer.Routing.NetworkWrouter do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/Quest" do
    conn
    |> send_resp(
      200,
      MapToXml.from_map(%{
        "QuestListResult" => %{
          "Quest" => [
            %{
              "QuestNo" => 1,
              "QuestLevel" => 1,
              "Stats" => 1,
              "TitleText" => "Fcuk, a string"
            },
            %{
              "QuestNo" => 2,
              "QuestLevel" => 1,
              "Stats" => 1,
              "TitleText" => "Fcuk2, a string"
            }
          ]
        }
      })
    )
  end

  # get "/Friends" do
  #   conn
  #   |> send_resp(200, MapToXml.from_map(
  #     %{
  #       "NetworkFriendsResult" =>  %{
  #         "Type" => 1,
  #         "AccountNo" => 1,
  #         "LogonID" => "test",
  #         "Friend" => [
  #           %{
  #             "Type" => 2,
  #             "AccountNo" => 2
  #           }
  #         ]
  #       }
  #     }
  #   ))
  # end

  forward("/Message", to: GAPIServer.Routing.Network.MessageRouter)

  match _ do
    send_resp(conn, 404, "")
  end
end
