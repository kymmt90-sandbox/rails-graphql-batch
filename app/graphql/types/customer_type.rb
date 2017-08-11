Types::CustomerType = GraphQL::ObjectType.define do
  name 'Customer'

  field :name, !types.String
  connection :orders, Types::OrderType.connection_type do
    resolve ->(customer, args, ctx) {
      Loaders::HasManyAssociationLoader.for(Order, :customer_id).load(customer.id)
    }
  end
  connection :deliverers, Types::DelivererType.connection_type do
    resolve ->(customer, args, ctx) {
      Loaders::HasManyAssociationLoader.for(Order, :customer_id).load(customer.id).then do |orders|
        Loaders::RecordLoader.for(Deliverer).load_many(orders.map(&:deliverer_id))
      end
    }
  end
end
