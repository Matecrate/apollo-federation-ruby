require_relative "./graphql_server"

SUMMONERS = {
  "365" => { summoner_icon: "icon_365" },
  "366" => { summoner_icon: "icon_366" },
  "367" => { summoner_icon: "icon_367" },
  "368" => { summoner_icon: "icon_368" },
  "369" => { summoner_icon: "icon_369" }
}

class User < BaseObject
  key fields: "id"
  extend_type
  field :id, ID, null: false, external: true
  field :summoner_icon, String, null: false

  def summoner_icon
    SUMMONERS[object[:id]][:summoner_icon]
  end
end

class SummonersSchema < GraphQL::Schema
  include ApolloFederation::Schema

  orphan_types User
end

GraphQLServer.run(SummonersSchema, Port: 3002)
