defmodule PhoenixChannelWorkshop.Hook do
  def notify(context) do
    broadcaster().notify(context)
  end

  defp broadcaster, do: Application.get_env(:phoenix_channel_workshop, :hook_broadcaster)
end
