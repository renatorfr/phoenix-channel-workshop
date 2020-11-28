defmodule PhoenixChannelWorkshopWeb.PingTest do
  use PhoenixChannelWorkshopWeb.ConnCase

  test "GET /ping", %{conn: conn} do
    conn = get(conn, "/ping")

    assert response(conn, 200)
  end
end
