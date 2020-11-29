defmodule PhoenixChannelWorkshop.Store do
  @spec purchase(list(), integer()) :: {:ok | :error, map()}
  def purchase(product_ids, price_total) do
    # Something really complex, validation, saves to database, do some coffee, etc...

    {:ok, %{product_ids: product_ids, price_total: price_total}}
  end
end
