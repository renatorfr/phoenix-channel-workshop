defmodule PhoenixChannelWorkshopGraphQL do
  def document_providers(_) do
    [Absinthe.Plug.DocumentProvider.Default, PhoenixChannelWorkshopGraphQL.CompiledQueries]
  end
end
