defmodule PhoenixChannelWorkshop.Repo do
  use Ecto.Repo,
    adapter: Ecto.Adapters.Postgres,
    otp_app: :phoenix_channel_workshop

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, Application.get_env(:phoenix_channel_workshop, __MODULE__)[:url])}
  end
end
