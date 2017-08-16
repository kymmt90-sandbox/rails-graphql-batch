Types::DelivererType = GraphQL::ObjectType.define do
  name 'Deliverer'

  field :name, !types.String
  connection :orders, Types::OrderType.connection_type do
    resolve ->(deliverer, args, ctx) {
      Loaders::HasManyAssociationLoader.for(Deliverer, :orders).load(deliverer)
    }
  end
  connection :customers, Types::CustomerType.connection_type do
    resolve ->(deliverer, args, ctx) {
      Loaders::HasManyAssociationLoader.for(Deliverer, :customers).load(deliverer)
    }
  end
end
