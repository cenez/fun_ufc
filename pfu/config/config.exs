# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pfu,
  ecto_repos: [Pfu.Repo]

# Configures the endpoint
config :pfu, PfuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/fJ9n5YWNbFEwXGgNSf6QtQFj89+pa6C7wOzg+h4bIorN8Y9VtRCFFRTj9XQrhew",
  render_errors: [view: PfuWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pfu.PubSub,
  live_view: [signing_salt: "NiZHpulo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
