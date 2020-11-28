defmodule PhoenixChannelWorkshopGraphQL.Router do
  use Plug.Router

  defmodule GraphQL do
    use Plug.Router
    use NewRelic.Transaction

    plug(:match)
    plug(:dispatch)

    forward("/",
      to: Absinthe.Plug,
      init_opts: [
        document_providers: {PhoenixChannelWorkshopGraphQL, :document_providers},
        json_codec: Jason,
        schema: PhoenixChannelWorkshopGraphQL.Schema
      ]
    )
  end

  plug(PhoenixChannelWorkshopGraphQL.Plugs.Context)

  plug(:match)
  plug(:dispatch)

  forward("/graphql", to: GraphQL)

  match(_, do: conn)
end
