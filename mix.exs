defmodule RimeDict.MixProject do
  use Mix.Project

  def project do
    [
      app: :rime_dict,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:csv, "~> 2.3"},
      {:progress_bar, "~> 2.0"}
    ]
  end
end
