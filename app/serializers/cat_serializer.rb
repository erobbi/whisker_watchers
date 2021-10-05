class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :cat_url, :food_per_day, :user_id, :bcs, :weights

  def weights
    object.weights.sort_by(&:id)
  end
end
