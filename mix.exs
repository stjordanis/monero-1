defmodule Monero.Mixfile do
  use Mix.Project

  def project do
    [
      app: :monero,
      version: version(),
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      package: package(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      description: "Monero API client",
      name: "Monero",
      source_url: "https://github.com/libra-ventures/monero",
      docs: [
        main: "Monero",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:hackney,      "~> 1.9",   optional: true},
      {:jsx,          "~> 2.8",   optional: true},
      {:poison,       ">= 3.0.0", optional: true},
      {:httpdigest,   "~> 0.0.1", optional: true},
      {:ex_doc,       "~> 0.16",  only: :dev, runtime: false},
      {:dialyze,      "~> 0.2.0", only: :dev},
      {:bypass,       "~> 0.7",   only: :test},
      {:excoveralls,  "~> 0.7",   only: :test}
    ]
  end

  defp version(), do: "0.10.0"

  defp package() do
    [
      files: ["lib", "config", "mix.exs", "README*"],
      maintainers: ["Yevhenii Kurtov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/libra-ventures/monero"}
    ]
  end
end
