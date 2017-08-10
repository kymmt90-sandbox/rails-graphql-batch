Types::OrderType = GraphQL::ObjectType.define do
  name 'Order'

  field :price, !types.Int
  field :customer, !Types::CustomerType do
    resolve ->(order, args, ctx) {
      Loaders::RecordLoader.for(Customer).load(order.customer_id)
    }
  end
end
