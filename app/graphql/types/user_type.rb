Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :email, !types.String
  connection :customers, Types::CustomerType.connection_type do
    resolve ->(user, args, ctx) {
      Loaders::HasManyAssociationLoader.for(User, :customers).load(user)
    }
  end
end
