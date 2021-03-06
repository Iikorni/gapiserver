defmodule GAPIServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :gapiserver,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {GAPIServer.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:elixir_map_to_xml, "~> 0.1.0"},
      {:remix, "~> 0.0.1", only: :dev}
    ]
  end
end
