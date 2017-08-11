Types::DelivererType = GraphQL::ObjectType.define do
  name 'Deliverer'

  field :name, !types.String
  connection :orders, Types::OrderType.connection_type do
    resolve ->(deliverer, args, ctx) {
      Loaders::HasManyAssociationLoader.for(Order, :deliverer_id).load([deliverer.id])
    }
  end
  connection :customers, Types::CustomerType.connection_type do
    resolve ->(deliverer, args, ctx) {
      Loaders::HasManyAssociationLoader.for(Order, :deliverer_id).load([deliverer.id]).then do |orders|
        Loaders::RecordLoader.for(Customer).load_many(orders.map(&:customer_id))
      end
    }
  end
end
