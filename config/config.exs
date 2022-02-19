# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :get5_api,
  ecto_repos: [Get5Api.Repo],
  generators: [binary_id: true],
  env: config_env()

# Configures the endpoint
config :get5_api, Get5ApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MaVRItF5pUXwisQld88PmNLIhCUsxNkuyftzqZh2AwToCGLdnwfeWvZbKq0gH3j1",
  render_errors: [view: Get5ApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Get5Api.PubSub,
  live_view: [signing_salt: "MfwQGPQ2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Uberauth
config :ueberauth, Ueberauth,
  providers: [
    steam: {Ueberauth.Strategy.Steam, []}
  ]

# Uberauth Steam strategy
config :ueberauth, Ueberauth.Strategy.Steam, api_key: System.get_env("STEAM_API_KEY")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
