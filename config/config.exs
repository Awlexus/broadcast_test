# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :broadcast_test, BroadcastTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nL4amN3bCx4CkvbhGq2bBLzMO8OpAB9eIXSePkyEsW4u6da5R7ZFcyCW/mfkKX2F",
  render_errors: [view: BroadcastTestWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: BroadcastTest.PubSub,
  live_view: [signing_salt: "At/ijtv/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
