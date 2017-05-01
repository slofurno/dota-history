defmodule ValveApi do
  @behaviour HistoryFetcher

  def player_history(id) do
    url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=65C5ADADF141DB0495C3FBBCA6D65689&account_id=#{id}"

    %HTTPoison.Response{body: body} = HTTPoison.get!(url)

    IO.inspect(body)

    %{"result" => %{matches: matches}} = Poison.decode!(body, as: %{"result" => %MatchHistoryResponse{matches: [%DotaMatch{players: [%DotaMatchPlayer{}]}]}})

    {:ok, matches}
  end

  def player_history(id, matches, start_at) do
    # https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/V001/?key=65C5ADADF141DB0495C3FBBCA6D65689&start_at_match_id=&account_id=
  end

  def match_details(match) do
    url = "https://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=65C5ADADF141DB0495C3FBBCA6D65689&match_id=#{match}"

    %HTTPoison.Response{body: body} = HTTPoison.get!(url)
    %{"result" => result} = Poison.decode!(body, as: %{"result" => %MatchDetails{players: [%DotaPlayer{}]}})

    {:ok, result}
  end

end