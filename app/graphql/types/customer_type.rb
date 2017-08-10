Types::CustomerType = GraphQL::ObjectType.define do
  name 'Customer'

  field :name, !types.String
  connection :orders, Types::OrderType.connection_type do
    resolve ->(customer, args, ctx) {
      HasManyAssociationLoader.for(Order, :customer_id).load(customer.id)
    }
  end
end
