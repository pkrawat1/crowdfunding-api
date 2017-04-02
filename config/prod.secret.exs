use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :crowdfunding_api, CrowdfundingApi.Endpoint,
  secret_key_base: "uR5Enuh7NdaNFO1p0Zv9oe7lcn8V3c3LIrwXlXw9sMrWC5g9U8e8pil+0MYtQopY"

# Configure your database
config :crowdfunding_api, CrowdfundingApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "crowdfunding_api_prod",
  pool_size: 20
