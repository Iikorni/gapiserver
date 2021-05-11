defmodule GAPIServer.Routing.MainRouter do
  use Plug.Router


  if Mix.env == :dev do
    use Plug.Debugger
  end

  use Plug.ErrorHandler

  plug Plug.Logger
  plug :match
  plug :dispatch

  forward "/Server", to: GAPIServer.Routing.ServerRouter

  match _ do
    send_resp(conn, 404, "not found")
  end

  defp handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    send_resp(conn, conn.status, "Something went wrong")
  end
end
