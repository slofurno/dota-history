defmodule DotaHistory.Router do
  use Plug.Router
  use Plug.Builder

  plug :match
  plug :dispatch

  match _ do
    {:ok, %{players: players}} = HistoryFetcher.match_details(3141714125)
    send_resp(conn, 200, Poison.encode!(players))
  end
end
