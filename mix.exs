defmodule DotaHistory.Mixfile do
  use Mix.Project

  def project do
    [app: :dota_history,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :cowboy, :httpoison], mod: {DotaHistory, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:cowboy, "1.0.0"},
      {:plug, "~> 1.0"},
      {:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.0"},
      {:distillery, "~> 1.0"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}]
  end
end
