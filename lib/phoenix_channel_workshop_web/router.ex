defmodule PhoenixChannelWorkshopWeb.Router do
  use Phoenix.Router

  pipeline :browser do
    plug(:accepts, ["html", "json"])

    plug(:session)
    plug(:fetch_session)
    plug(:fetch_flash)

    plug(:protect_from_forgery)
    plug(PhoenixChannelWorkshopWeb.ContentSecurityPolicy)

    plug(:put_layout, {PhoenixChannelWorkshopWeb.Layouts.View, :app})

    plug(NewRelic.Transaction.Plug)
    plug(NewRelic.Phoenix.Transaction.Plug)
    plug(NewRelic.DistributedTrace.Plug)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", PhoenixChannelWorkshopWeb do
    pipe_through(:browser)

    get("/", Home.Controller, :index, as: :home)
  end

  scope "/api", PhoenixChannelWorkshopWeb do
    pipe_through(:api)

    post("/purchase", Store.Controller, :purchase, as: :store)
  end

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  defp session(conn, _opts) do
    opts =
      Plug.Session.init(
        store: :cookie,
        key: Application.get_env(:phoenix_channel_workshop, __MODULE__)[:session_key],
        signing_salt: Application.get_env(:phoenix_channel_workshop, __MODULE__)[:session_signing_salt]
      )

    Plug.Session.call(conn, opts)
  end
end
