Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :email, !types.String
  connection :customers, Types::CustomerType.connection_type
end
