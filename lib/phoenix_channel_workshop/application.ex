defmodule PhoenixChannelWorkshop.Application do
  @moduledoc """
  Main entry point of the app
  """

  use Application

  def start(_type, _args) do
    children = [
      # PhoenixChannelWorkshop.Repo,
      {Phoenix.PubSub, [name: PhoenixChannelWorkshop.PubSub, adapter: Phoenix.PubSub.PG2]},
      PhoenixChannelWorkshopWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: PhoenixChannelWorkshop.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    PhoenixChannelWorkshopWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
