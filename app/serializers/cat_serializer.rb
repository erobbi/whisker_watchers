class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :cat_url, :food_per_day, :user_id
  has_many :weights
end
