defmodule PhoenixChannelWorkshop.Hook.Context do
  defstruct event: "", payload: %{}

  @type t :: %__MODULE__{}
end
