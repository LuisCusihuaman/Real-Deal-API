# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :real_deal_api,
  ecto_repos: [RealDealApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :real_deal_api, RealDealApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: RealDealApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RealDealApi.PubSub,
  live_view: [signing_salt: "UJiTWgtU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :real_deal_api, RealDealApiWeb.Auth.Guardian,
  issuer: "real_deal_api",
  secret_key: "P/6UoEn5V8hTp1Fs7QmbL5iBOzFBk9788DCK/eoBZgO/bbhNpSfdC6zPYXP/LPaI"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :guardian, Guardian.DB,
  repo: RealDealApi.Repo,
  schema: "guardian_tokens",
  sweep_interval: 60 #seconds


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
