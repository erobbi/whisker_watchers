class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :cat_url, :isNeutered, :caloriesPerDay, :user_id, :bcs, :suggestedCaloriesPerDay, :currentWeight, :goalWeight, :weights
  has_many :weights

  def weights
    object.weights.sort_by(&:id)
  end

end
