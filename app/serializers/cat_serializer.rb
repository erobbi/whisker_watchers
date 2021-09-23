class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :food_per_day, :user_id
  has_many :weights
end
