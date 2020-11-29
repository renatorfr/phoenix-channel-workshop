defmodule PhoenixChannelWorkshopWeb.Store.Controller do
  use Phoenix.Controller

  plug(:put_view, PhoenixChannelWorkshopWeb.Store.View)

  alias PhoenixChannelWorkshop.Store

  @spec purchase(Plug.Conn.t(), map) :: Plug.Conn.t()
  def purchase(conn, %{"product_ids" => product_ids, "price_total" => price_total}) do
    price_total = String.to_integer(price_total)

    {:ok, purchase} = Store.purchase(product_ids, price_total)

    render(
      conn,
      "purchase.json",
      product_ids: purchase.product_ids,
      price_total: purchase.price_total
    )
  end
end
