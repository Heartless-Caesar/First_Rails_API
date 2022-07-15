class DigimonSerializer
  include JSONAPI::Serializer
  attributes :name, :type
  #test
  belongs_to :UserSerializer
end
