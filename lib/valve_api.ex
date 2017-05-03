defmodule ValveApi do
  @behaviour HistoryFetcher

  def player_history(id) do
    url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=65C5ADADF141DB0495C3FBBCA6D65689&account_id=#{id}"
    %HTTPoison.Response{body: body} = HTTPoison.get!(url)
    %{"result" => %{matches: matches}} = Poison.decode!(body, as: %{"result" => %MatchHistoryResponse{matches: [%DotaMatch{players: [%DotaMatchPlayer{}]}]}})

    {:ok, matches}
  end

  def player_history(id, matches, start_at) do
    # https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=65C5ADADF141DB0495C3FBBCA6D65689&start_at_match_id=&account_id=
  end

  @doc"""
  given a match id, returns a `MatchDetails` struct

      {
        radiant_win: true
        "players": [{
            "account_id": 67760037,
            "hero_id": 75,
            "kills": 19,
            "deaths": 4,
            "assists": 19
        }]
      }
  """
  def match_details(match) do
    url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=65C5ADADF141DB0495C3FBBCA6D65689&match_id=#{match}"

    %HTTPoison.Response{body: body} = HTTPoison.get!(url)
    %{"result" => result} = Poison.decode!(body, as: %{"result" => %MatchDetails{players: [%DotaPlayer{}]}})

    {:ok, result}
  end

end
