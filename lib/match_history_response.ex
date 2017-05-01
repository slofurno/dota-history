defmodule MatchHistoryResponse do
  defstruct [:status, :num_results, :total_results, :results_remaining, :matches]
end

defmodule MatchDetails do
  defstruct [:players, :radiant_win]
end

defmodule DotaPlayer do
  defstruct [:account_id, :hero_id, :kills, :deaths, :assists]
end

defmodule DotaMatch do
  defstruct [:match_id, :start_time, :players]
end

defmodule DotaMatchPlayer do
  defstruct [:account_id, :player_slot, :hero_id]
end

defmodule HistoryFetcher do
  @fetcher Application.get_env(:dota_history, :history_fetcher)

  @callback player_history(integer) :: {:ok, [%DotaMatch{}]} | {:error, String.t}
  @callback match_details(integer) :: {:ok, %MatchDetails{}} | {:error, String.t}

  def player_history(id) do
    @fetcher.player_history(id)
  end

  def match_details(match) do
    @fetcher.match_details(match)
  end
end
