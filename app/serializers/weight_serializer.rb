class WeightSerializer < ActiveModel::Serializer
  attributes :id, :weight, :cat_id, :created_at
end
