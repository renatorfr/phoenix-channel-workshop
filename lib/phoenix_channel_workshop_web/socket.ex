defmodule PhoenixChannelWorkshopWeb.Socket do
  use Phoenix.Socket

  channel("store", PhoenixChannelWorkshopWeb.StoreChannel)

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
