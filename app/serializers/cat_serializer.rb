class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :cat_url, :food_per_day, :user_id, :current_weight
  has_many :weights
end
