defmodule PhoenixChannelWorkshop.Hook.Broadcaster.Receiver do
  use PhoenixChannelWorkshop.Hook.PubSub.Subscriber, subscribe_to: [PhoenixChannelWorkshop.Hook.Broadcaster.Sender]

  alias PhoenixChannelWorkshop.Hook

  @channel "store"
  @supported_events ~w(purchase)

  def handle_events(messages, _from, {:endpoint, endpoint} = state) do
    messages
    |> Enum.filter(&filter_event/1)
    |> Enum.each(fn message ->
      message
      |> serialize_payload()
      |> broadcast_message(endpoint)
    end)

    {:noreply, [], state}
  end

  defp filter_event(%Hook.Context{event: event}), do: event in @supported_events

  defp broadcast_message(message, endpoint) do
    endpoint.broadcast(@channel, message.event, message.payload)
  end

  defp serialize_payload(%Hook.Context{} = message) do
    # Some transformation in the payload to be sent to the clients
    message
  end
end
