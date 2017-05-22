defmodule Kong.Mixfile do
  use Mix.Project

  def project do
    [app: :kong,
     version: "0.0.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Simple wrapper around the Kong Admin REST API.",
     package: package(),
     deps: deps(),
     docs: [
       main: "readme",
        extras: ["README.md"]
     ]]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:credo, "~> 0.7.4", only: [:dev, :test]},
      {:httpoison, "~> 0.11.1"},
      {:poison, "~> 3.0"}
    ]
  end

  defp package do
    [
      name: :kong,
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Stephan Lagerwaard"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/stephlow/kong"}
    ]
  end
end
