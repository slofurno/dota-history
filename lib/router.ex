defmodule DotaHistory.Router do
  use Plug.Router
  use Plug.Builder

  plug :match
  plug :dispatch

  match _ do
    with {:ok, matches} <- HistoryFetcher.player_history(67760037),
      {:ok, id} <- MatchUtils.first_match_id(matches),
      {:ok, %{players: players}} = HistoryFetcher.match_details(id) do
        send_resp(conn, 200, Poison.encode!(players))
    else
      {:error, reason} -> send_resp(conn, 404, reason)
    end
  end
end

defmodule MatchUtils do
  def first_match_id([%{match_id: match_id}|xs]), do: {:ok, match_id}
  def first_match_id(_), do: {:error, :no_matches}
end
