defmodule PhoenixChannelWorkshop.Hook.Broadcaster do
  @sender PhoenixChannelWorkshop.Hook.Broadcaster.Sender

  @callback notify(PhoenixChannelWorkshop.Hook.Context.t()) :: no_return()

  @timeout 10_000

  def notify(%PhoenixChannelWorkshop.Hook.Context{} = context) do
    GenStage.call(@sender, {:notify, context}, @timeout)
  end
end
