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



#********************************
# Social Login Config
#********************************
  config :ueberauth, Ueberauth,
    providers: [
      facebook: { Ueberauth.Strategy.Facebook, [] },
      # github: { Ueberauth.Strategy.Google, [ opt1: "value", opts2: "value" ] }
    ]

  config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
    client_id: "1858256201095547", # System.get_env("FACEBOOK_CLIENT_ID"),
    client_secret: "08995d4a535aae99cffae561cf730e6d"# System.get_env("FACEBOOK_CLIENT_SECRET")
#********************************
#********************************





# config :ex_cloudinary,
#   cloud_name: System.get_env("CLOUDINARY_CLOUD_NAME"),
#   api_key: System.get_env("CLOUDINARY_API_KEY"),
#   api_secret: System.get_env("CLOUDINARY_API_SECRET")	

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: CrowdfundingApi.User,
  repo: CrowdfundingApi.Repo,
  module: CrowdfundingApi,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :confirmable, :registerable]

config :coherence, CrowdfundingApi.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
