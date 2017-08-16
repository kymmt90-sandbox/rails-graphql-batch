Types::CustomerType = GraphQL::ObjectType.define do
  name 'Customer'

  field :name, !types.String
  connection :orders, Types::OrderType.connection_type do
    resolve ->(customer, args, ctx) {
      Loaders::HasManyAssociationLoader.for(Customer, :orders).load(customer)
    }
  end
  connection :deliverers, Types::DelivererType.connection_type do
    resolve ->(customer, args, ctx) {
      Loaders::HasManyAssociationLoader.for(Customer, :deliverers).load(customer)
    }
  end
end
