defmodule PhoenixChannelWorkshop.FactoryTest do
  @moduledoc """
  This is a test module to make sure our factory setup is working correctly.
  You’ll probably want to delete it.
  """

  use PhoenixChannelWorkshop.DataCase, async: true

  import PhoenixChannelWorkshop.Factory

  test "build/1 works with our factory setup" do
    assert is_binary(build(:name))
  end
end
