Types::OrderType = GraphQL::ObjectType.define do
  name 'Order'

  field :price, !types.Int
  field :customer, !Types::CustomerType do
    resolve ->(order, args, ctx) {
      Loaders::RecordLoader.for(Customer).load(order.customer_id)
    }
  end
  field :deliverer, !Types::DelivererType  do
    resolve ->(order, args, ctx) {
      Loaders::RecordLoader.for(Deliverer).load(order.deliverer_id)
    }
  end
end
