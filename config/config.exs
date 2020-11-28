import Config

version = Mix.Project.config()[:version]

config :phoenix_channel_workshop,
  ecto_repos: [PhoenixChannelWorkshop.Repo],
  version: version

config :phoenix, :json_library, Jason

config :phoenix_channel_workshop, PhoenixChannelWorkshopWeb.Endpoint,
  pubsub_server: PhoenixChannelWorkshop.PubSub,
  render_errors: [view: PhoenixChannelWorkshopWeb.Errors.View, accepts: ~w(html json)]

config :phoenix_channel_workshop, PhoenixChannelWorkshop.Repo, start_apps_before_migration: [:ssl]

config :phoenix_channel_workshop, Corsica, allow_headers: :all

config :phoenix_channel_workshop, PhoenixChannelWorkshop.Gettext, default_locale: "en"

config :phoenix_channel_workshop, PhoenixChannelWorkshopWeb.ContentSecurityPolicy, allow_unsafe_scripts: false

config :sentry,
  root_source_code_path: File.cwd!(),
  release: version

config :logger, backends: [:console, Sentry.LoggerBackend]

# Import environment configuration
import_config "#{Mix.env()}.exs"
