defmodule PhoenixChannelWorkshopWeb.Errors.View do
  use Phoenix.View, root: "lib/phoenix_channel_workshop_web", path: "errors/templates", namespace: PhoenixChannelWorkshopWeb

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
