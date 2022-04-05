# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :app,
  namespace: DatingApp,
  ecto_repos: [DatingApp.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :app, DatingAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/KyHdnJzMjLYzSTfGJInZ3SXcoFwrnHPPV4EK78F9kqTSxO7Kcl7O/TAppjHsRPK",
  render_errors: [view: DatingAppWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DatingApp.PubSub,
  live_view: [signing_salt: "a3q+Ab34"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
