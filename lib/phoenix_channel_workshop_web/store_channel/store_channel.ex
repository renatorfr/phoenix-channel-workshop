defmodule PhoenixChannelWorkshopWeb.StoreChannel do
  use Phoenix.Channel

  def join("store" = topic, _payload, socket) do
    # Topic validation

    send(self(), topic)

    {:ok, socket}
  end

  def join(_topic, _params, _socket) do
    {:error, %{reason: "topic does not exist"}}
  end
end
