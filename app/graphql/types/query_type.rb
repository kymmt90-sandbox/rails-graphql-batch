Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :user do
    type Types::UserType
    argument :email, !types.String
    resolve ->(obj, args, ctx) {
      User.find_by!(email: args['email'])
    }
  end
end
