# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :crowdfunding_api,
  ecto_repos: [CrowdfundingApi.Repo]

# Configures the endpoint
config :crowdfunding_api, CrowdfundingApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/qw506aIc+yY1VoGTcIh+Xqg1EKRjFumjLA9C1Ro4D2FDy9SS+MHJaAHuDIs4Zrb",
  render_errors: [view: CrowdfundingApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CrowdfundingApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "CrowdfundingApi.#{Mix.env}",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: CrowdfundingApi.GuardianSerializer,
  secret_key: to_string(Mix.env),
  hooks: GuardianDb,
  permissions: %{
    default: [
      :read_profile,
      :write_profile,
      :read_token,
      :revoke_token,
    ],
  }

config :guardian_db, GuardianDb,
  repo: CrowdfundingApi.Repo



# config :ex_cloudinary,
#   cloud_name: System.get_env("CLOUDINARY_CLOUD_NAME"),
#   api_key: System.get_env("CLOUDINARY_API_KEY"),
#   api_secret: System.get_env("CLOUDINARY_API_SECRET")	

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
