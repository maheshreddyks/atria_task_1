# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :atria_task_1,
  ecto_repos: [AtriaTask1.Repo]

# Configures the endpoint
config :atria_task_1, AtriaTask1Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TS4jxcCmx6yiX5aAWP2TvvwMzC3YiFkOXIhDXc1U2e4SfslXbFA33ccikze7XZns",
  render_errors: [view: AtriaTask1Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AtriaTask1.PubSub,
  live_view: [signing_salt: "OmRUFAmf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
