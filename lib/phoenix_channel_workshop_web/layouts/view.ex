defmodule PhoenixChannelWorkshopWeb.Layouts.View do
  use Phoenix.View, root: "lib/phoenix_channel_workshop_web", path: "layouts/templates", namespace: PhoenixChannelWorkshopWeb
  use Phoenix.HTML

  import Phoenix.Controller, only: [get_flash: 2]

  alias PhoenixChannelWorkshopWeb.Router.Helpers, as: Routes
end
