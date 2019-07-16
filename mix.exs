defmodule Memoized.MixProject do
  use Mix.Project

  @source_url "https://github.com/ccapndave/elixir-memoized"

  def project do
    [
      app: :memoized,
      version: "0.1.0",
      description: "Memoize functions in the current process",
      source_url: @source_url,
      homepage_url: @source_url,
      licenses: [],
      docs: [
        main: "readme",
        extras: ["README.md"]
      ],
      package: [
        maintainers: ["Dave Keen"],
        licenses: ["MIT"],
        links: %{
          "GitHub" => @source_url
        }
      ],
      elixir: "~> 1.9",
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, "~> 0.20.2", only: :dev, runtime: false}
    ]
  end
end
