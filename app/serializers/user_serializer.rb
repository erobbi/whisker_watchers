class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :avatar_url, :total_cats
  has_many :cats
end
