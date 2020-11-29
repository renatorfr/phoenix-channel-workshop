defmodule PhoenixChannelWorkshopWeb.Store.View do
  use Phoenix.View, root: "lib/phoenix_channel_workshop_web", namespace: PhoenixChannelWorkshopWeb

  def render("purchase.json", %{product_ids: product_ids, price_total: price_total}) do
    %{
      product_ids: product_ids,
      price_total: price_total
    }
  end
end
