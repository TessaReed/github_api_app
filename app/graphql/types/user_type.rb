module Types
  UserType = GraphQL::ObjectType.define do
    name "User"
    description "a user"

    field :id, !types.Int #what you can access on user, ! says required
    field :email, !types.String
    end
end
