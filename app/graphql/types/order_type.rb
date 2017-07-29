Types::OrderType = GraphQL::ObjectType.define do
  name 'Order'

  field :price, !types.Int
end
