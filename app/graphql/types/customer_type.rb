Types::CustomerType = GraphQL::ObjectType.define do
  name 'Customer'

  field :name, !types.String
  connection :orders, Types::OrderType.connection_type
end
