class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :age

  has_many :DigimonSerializer
end
