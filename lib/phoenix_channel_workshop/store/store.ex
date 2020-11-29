defmodule PhoenixChannelWorkshop.Store do
  alias PhoenixChannelWorkshop.Hook

  @spec purchase(list(), integer()) :: {:ok | :error, map()}
  def purchase(product_ids, price_total) do
    # Something really complex, validation, saves to database, do some coffee, etc...

    notify_broadcaster("purchase", %{product_ids: product_ids, price_total: price_total})

    {:ok, %{product_ids: product_ids, price_total: price_total}}
  end

  defp notify_broadcaster(event, payload) do
    Hook.notify(%Hook.Context{
      event: event,
      payload: payload
    })
  end
end
